package com.example.android.materialme;

import android.content.Context;
import android.content.Intent;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.bumptech.glide.Glide;

import java.util.ArrayList;

class SportsAdapter extends RecyclerView.Adapter<SportsAdapter.ViewHolder>
{
    private ArrayList<Sport> mSportsData;
    private Context mContext;

    SportsAdapter(Context context, ArrayList<Sport> sportsData)
    {
        this.mSportsData = sportsData;
        this.mContext = context;
    }

    @Override
    public SportsAdapter.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType)
    {
        return new ViewHolder(LayoutInflater.from(mContext).inflate(R.layout.list_item, parent, false));
    }

    @Override
    public void onBindViewHolder(SportsAdapter.ViewHolder holder, int position)
    {
        Sport currentSport = mSportsData.get(position);
        holder.bindTo(currentSport);
    }

    @Override
    public int getItemCount() {
        return mSportsData.size();
    }


    class ViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener
    {
        private TextView mTitleText;
        private TextView mInfoText;
        private ImageView mSportsImage;
        private TextView priceText;

        ViewHolder(View itemView)
        {
            super(itemView);

            mTitleText = itemView.findViewById(R.id.title);
            mInfoText = itemView.findViewById(R.id.subTitle);
            mSportsImage = itemView.findViewById(R.id.sportsImage);
            priceText = itemView.findViewById(R.id.cardPrice);

            itemView.setOnClickListener(this);
        }

        void bindTo(Sport currentSport)
        {
            mTitleText.setText(currentSport.getTitle());
            mInfoText.setText(currentSport.getInfo());
            priceText.setText(currentSport.getPrice());

            Glide.with(mContext).load(currentSport.getImageResource()).into(mSportsImage);
        }

        public void onClick(View view) { return; }
    }
}
