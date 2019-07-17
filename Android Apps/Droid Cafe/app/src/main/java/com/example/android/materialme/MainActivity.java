package com.example.android.materialme;

import android.content.Intent;
import android.content.res.TypedArray;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.CardView;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.helper.ItemTouchHelper;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.RelativeLayout;
import android.widget.Spinner;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.Collections;

public class MainActivity extends AppCompatActivity
{
    private RecyclerView mRecyclerView;
    private ArrayList<Sport> mSportsData;
    private SportsAdapter mAdapter;

    public static double priceCoffee;
    public static double priceTea;
    public static double priceBagel;
    public static double priceDonut;
    public static double priceMystery;

    protected static double getPriceCoffee() {
        return priceCoffee;
    }
    protected static double getPriceTea() {
        return priceTea;
    }
    protected static double getPriceBagel() {
        return priceBagel;
    }
    protected static double getPriceDonut() {
        return priceDonut;
    }
    protected static double getPriceMystery() {
        return priceMystery;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mRecyclerView = findViewById(R.id.recyclerView);
        mRecyclerView.setLayoutManager(new LinearLayoutManager(this));
        mSportsData = new ArrayList<>();
        mAdapter = new SportsAdapter(this, mSportsData);
        mRecyclerView.setAdapter(mAdapter);
        mRecyclerView.setNestedScrollingEnabled(false);


        initializeData();

        ItemTouchHelper helper = new ItemTouchHelper(new ItemTouchHelper
                .SimpleCallback(ItemTouchHelper.LEFT | ItemTouchHelper.RIGHT | ItemTouchHelper.DOWN |
                ItemTouchHelper.UP,ItemTouchHelper.LEFT | ItemTouchHelper.RIGHT)
        {
            @Override
            public boolean onMove(RecyclerView recyclerView, RecyclerView.ViewHolder viewHolder, RecyclerView.ViewHolder target)
            {
                int from = viewHolder.getAdapterPosition();
                int to = target.getAdapterPosition();

                Collections.swap(mSportsData, from, to);
                mAdapter.notifyItemMoved(from, to);
                return true;
            }

            @Override
            public void onSwiped(RecyclerView.ViewHolder viewHolder, int direction) { return; }
        });

        helper.attachToRecyclerView(mRecyclerView);
    }

    private void initializeData()
    {
        String[] sportsList = getResources().getStringArray(R.array.sports_titles);
        String[] sportsInfo = getResources().getStringArray(R.array.sports_info);
        TypedArray sportsImageResources = getResources().obtainTypedArray(R.array.sports_images);
        String[] prices = getResources().getStringArray(R.array.prices);
        mSportsData.clear();

        for (int i = 0; i < sportsList.length; i++)
            mSportsData.add(new Sport(sportsList[i], sportsInfo[i], sportsImageResources.getResourceId(i, 0), prices[i]));

        sportsImageResources.recycle();
        mAdapter.notifyDataSetChanged();
    }

    public void generateInvoice(View view)
    {
        for (int x = mRecyclerView.getChildCount(), i = 0; i < x; i++)
        {
            CardView card = (CardView) mRecyclerView.getChildAt(i);
            RelativeLayout layout = (RelativeLayout) card.getChildAt(0);

            TextView elemPrice = (TextView) layout.getChildAt(2);
            double strPrice = Double.parseDouble(elemPrice.getText().toString().substring(1));

            Spinner elemSpinner = (Spinner) layout.getChildAt(4);
            int strSelected = Integer.parseInt(elemSpinner.getSelectedItem().toString());


            if (i == 0) priceCoffee = strPrice * strSelected;
            else if (i == 1) priceTea = strPrice * strSelected;
            else if (i == 2) priceBagel = strPrice * strSelected;
            else if (i == 3) priceDonut = strPrice * strSelected;
            else if (i == 4) priceMystery = strPrice * strSelected;
        }

        Intent intent = new Intent(this, DetailActivity.class);
        startActivity(intent);
    }
}
