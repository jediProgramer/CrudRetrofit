package com.codedume_erlangga.crudretrofit.Activity;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;

import com.codedume_erlangga.crudretrofit.Adapter.HerosAdapter;
import com.codedume_erlangga.crudretrofit.Model.GetHeros;
import com.codedume_erlangga.crudretrofit.Model.Heros;
import com.codedume_erlangga.crudretrofit.R;
import com.codedume_erlangga.crudretrofit.Rest.ApiClient;
import com.codedume_erlangga.crudretrofit.Rest.ApiInterface;
import com.google.android.material.floatingactionbutton.FloatingActionButton;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class MainActivity extends AppCompatActivity {

    ApiInterface mApiInterface;
    private RecyclerView mRecyclerView;
    private RecyclerView.Adapter mAdapter;
    private RecyclerView.LayoutManager mLayoutManager;
    public static MainActivity ma;
    private FloatingActionButton fabAdd;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mRecyclerView = (RecyclerView) findViewById(R.id.rv_heros);
        mLayoutManager = new LinearLayoutManager(this);
        mRecyclerView.setLayoutManager(mLayoutManager);
        mApiInterface = ApiClient.getClient().create(ApiInterface.class);
        ma=this;
        refresh();

        fabAdd = findViewById(R.id.fab_add);
        fabAdd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(MainActivity.this, InsertActivity.class));
            }
        });
    }

    public void refresh() {
        Call<GetHeros> HerosCall = mApiInterface.getHeros();
        HerosCall.enqueue(new Callback<GetHeros>() {
            @Override
            public void onResponse(Call<GetHeros> call, Response<GetHeros>
                    response) {
                List<Heros> HerosList = response.body().getListDataHeros();
                Log.d("Retrofit Get", "Jumlah data Heros: " +
                        String.valueOf(HerosList.size()));
                mAdapter = new HerosAdapter(HerosList);
                mRecyclerView.setAdapter(mAdapter);
            }

            @Override
            public void onFailure(Call<GetHeros> call, Throwable t) {
                Log.e("Retrofit Get", t.toString());
            }
        });
    }
}