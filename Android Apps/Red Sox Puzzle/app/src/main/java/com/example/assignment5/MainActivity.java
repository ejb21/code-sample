package com.example.assignment5;

import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.ScaleDrawable;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
    ArrayList<PuzzlePiece> pieces;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //final ConstraintLayout layout = findViewById(R.id.layout);
        final RelativeLayout layout = findViewById(R.id.layout);
        ImageView imageView = findViewById(R.id.imageView);

        // run image related code after the view was laid out
        // to have all dimensions calculated
        imageView.post(new Runnable() {
            @Override
            public void run() {
                pieces = splitImage();
                TouchListener touchListener = new TouchListener();
                for(PuzzlePiece piece : pieces) {
                    piece.setOnTouchListener(touchListener);
                    layout.addView(piece);
                }
            }
        });
    }

    private ArrayList<PuzzlePiece> splitImage() {
        int piecesNumber = 12;
        int rows = 3;
        int cols = 4;

        ImageView imageView = findViewById(R.id.imageView);
        ArrayList<PuzzlePiece> pieces = new ArrayList<>(piecesNumber);

        // Get the scaled bitmap of the source image
        BitmapDrawable drawable = (BitmapDrawable) imageView.getDrawable();
        Bitmap bitmap = Bitmap.createScaledBitmap(drawable.getBitmap(), 400, 300, false);

        int[] dimensions = getBitmapPositionInsideImageView(imageView);
        int scaledBitmapLeft = dimensions[0];
        int scaledBitmapTop = dimensions[1];
        int scaledBitmapWidth = dimensions[2];
        int scaledBitmapHeight = dimensions[3];

        int croppedImageWidth = scaledBitmapWidth - 2 * Math.abs(scaledBitmapLeft);
        int croppedImageHeight = scaledBitmapHeight - 2 * Math.abs(scaledBitmapTop);

        Bitmap scaledBitmap = Bitmap.createScaledBitmap(bitmap, scaledBitmapWidth, scaledBitmapHeight, true);
        Bitmap croppedBitmap = Bitmap.createBitmap(scaledBitmap, Math.abs(scaledBitmapLeft), Math.abs(scaledBitmapTop), croppedImageWidth, croppedImageHeight);

        // Calculate the width and height of the pieces
        int pieceWidth = bitmap.getWidth()/cols;
        int pieceHeight = bitmap.getHeight()/rows;

        // Create each bitmap piece and add it to the resulting array
        int yCoord = 0;
        for (int row = 0; row < rows; row++) {
            int xCoord = 0;
            for (int col = 0; col < cols; col++) {
                Bitmap pieceBitmap = Bitmap.createBitmap(bitmap, xCoord, yCoord, pieceWidth, pieceHeight);
                PuzzlePiece piece = new PuzzlePiece(getApplicationContext());
                piece.setImageBitmap(pieceBitmap);
                piece.xCoord = (int)(xCoord * 3.5);
                piece.yCoord = (int)(yCoord * 3.5);
                piece.pieceWidth = pieceWidth;
                piece.pieceHeight = pieceHeight;
                pieces.add(piece);
                xCoord += pieceWidth;
            }
            yCoord += pieceHeight;
        }

        return pieces;
    }

    private int[] getBitmapPositionInsideImageView(ImageView imageView) {
        int[] ret = new int[4];

        if (imageView == null || imageView.getDrawable() == null)
            return ret;

        // Get image dimensions
        // Get image matrix values and place them in an array
        float[] f = new float[9];
        imageView.getImageMatrix().getValues(f);

        // Extract the scale values using the constants (if aspect ratio maintained, scaleX == scaleY)
        final float scaleX = f[Matrix.MSCALE_X];
        final float scaleY = f[Matrix.MSCALE_Y];

        // Get the drawable (could also get the bitmap behind the drawable and getWidth/getHeight)
        final Drawable d = imageView.getDrawable();
        final int origW = d.getIntrinsicWidth();
        final int origH = d.getIntrinsicHeight();

        // Calculate the actual dimensions
        final int actW = Math.round(origW * scaleX);
        final int actH = Math.round(origH * scaleY);

        ret[2] = actW;
        ret[3] = actH;

        // Get image position
        // We assume that the image is centered into ImageView
        int imgViewW = imageView.getWidth();
        int imgViewH = imageView.getHeight();

        int top = (int) (imgViewH - actH)/2;
        int left = (int) (imgViewW - actW)/2;

        ret[0] = left;
        ret[1] = top;

        return ret;
    }
}