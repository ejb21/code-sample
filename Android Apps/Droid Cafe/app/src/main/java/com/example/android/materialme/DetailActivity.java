package com.example.android.materialme;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.widget.ImageView;
import android.widget.TextView;

import com.bumptech.glide.Glide;

public class DetailActivity extends AppCompatActivity
{
    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_detail);

        TextView coffeeSubtotal = findViewById(R.id.coffeeSubtotal);
        TextView teaSubtotal = findViewById(R.id.teaSubtotal);
        TextView bagelSubtotal = findViewById(R.id.bagelSubtotal);
        TextView donutSubtotal = findViewById(R.id.donutSubtotal);
        TextView mysterySubtotal = findViewById(R.id.mysterySubtotal);
        TextView totalTotal = findViewById(R.id.totalTotal);

        coffeeSubtotal.setText("$" + MainActivity.getPriceCoffee() + "0");
        teaSubtotal.setText("$" + MainActivity.getPriceTea() + "0");
        bagelSubtotal.setText("$" + MainActivity.getPriceBagel() + "0");
        donutSubtotal.setText("$" + MainActivity.getPriceDonut() + "0");
        mysterySubtotal.setText("$" + MainActivity.getPriceMystery() + "0");

        double dblTotal = MainActivity.getPriceCoffee() + MainActivity.getPriceTea() +
                MainActivity.getPriceBagel() + MainActivity.getPriceDonut() + MainActivity.getPriceMystery();

        totalTotal.setText("$" + dblTotal + "0");
    }
}