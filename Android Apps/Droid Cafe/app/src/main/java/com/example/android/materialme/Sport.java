package com.example.android.materialme;

class Sport
{
    private String title;
    private String info;
    private final int imageResource;
    private String price;

    public Sport(String title, String info, int imageResource, String price)
    {
        this.title = title;
        this.info = info;
        this.imageResource = imageResource;
        this.price = price;
    }

    String getTitle() {
        return title;
    }
    String getInfo() {
        return info;
    }
    public int getImageResource() {
        return imageResource;
    }
    String getPrice() {
        return price;
    }

}
