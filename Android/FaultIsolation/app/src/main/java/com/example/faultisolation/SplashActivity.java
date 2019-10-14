package com.example.faultisolation;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.view.Window;
import android.view.WindowManager;

public class SplashActivity extends AppCompatActivity {
Context context;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        requestWindowFeature(Window.FEATURE_NO_TITLE);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,WindowManager.LayoutParams.FLAG_FULLSCREEN);
        setContentView(R.layout.activity_splash);

        context=SplashActivity.this;
        getSupportActionBar().hide();

        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {

                String login_status = new PreferenceHelper(SplashActivity.this).getString(Constants.LOGIN_FLAG);
                if (login_status.equals("true")) {
                    Intent i = new Intent(SplashActivity.this, ViewAlert.class);
                    startActivity(i);

                } else {
                    Intent i = new Intent(SplashActivity.this, MainActivity.class);
                    startActivity(i);

                }

            }
        }, 3000);
    }

}
