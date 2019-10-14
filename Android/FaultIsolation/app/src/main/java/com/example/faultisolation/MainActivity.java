package com.example.faultisolation;


import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.os.Bundle;
import android.os.StrictMode;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import org.ksoap2.serialization.SoapObject;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {
EditText et_user,et_pass;
Button bt_login;
PreferenceHelper preferenceHelper;
public  static  String uid,type;
TextView signup;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        try
        {
            if(android.os.Build.VERSION.SDK_INT>9)
            {
                StrictMode.ThreadPolicy policy=new StrictMode.ThreadPolicy.Builder().permitAll().build();
                StrictMode.setThreadPolicy(policy);
            }
        }
        catch(Exception e)
        {

        }

        getSupportActionBar().hide();


        initData();
    }

    private void initData() {
        et_user=findViewById(R.id.et_user);
        et_pass=findViewById(R.id.et_password);
        bt_login=findViewById(R.id.btn_login);
        signup=findViewById(R.id.txt_signup);
        signup.setOnClickListener(this);
        bt_login.setOnClickListener(this);
        preferenceHelper=new PreferenceHelper(this);
    }

    @Override
    public void onClick(View v) {
            switch (v.getId())
            {
                case R.id.btn_login:
                    if(et_user.getText().toString().equals("")){
                            et_user.setError("Username field is required");
                            et_user.requestFocus();
                        }else if(et_pass.getText().toString().equals("")){
                            et_pass.setError("Password field is required");
                            et_pass.requestFocus();
                        }else
                           {
                            SoapObject obj = new SoapObject(soapclass.NAMESPACE, "login");
                            obj.addProperty("uname", et_user.getText().toString());
                            obj.addProperty("pswd", et_pass.getText().toString());
                            soapclass sc = new soapclass();
                            String ou = sc.Callsoap(obj, "http://tempuri.org/login");
                            // Toast.makeText(getApplicationContext(), ou, Toast.LENGTH_SHORT).show();
                                if (!ou.equals("error") && !ou.equals("")) {
                                  uid=ou;
                                  type="Worker";
                                        preferenceHelper.putString(Constants.LOGIN_FLAG, "true");
                                        preferenceHelper.putString(Constants.UId, ou);
                                        startActivity(new Intent(this, ViewAlert.class));
                                        finish();
                                        Toast.makeText(getApplicationContext(), "logi success", Toast.LENGTH_SHORT).show();



                                } else {
                                    Toast.makeText(getApplicationContext(), "login failed", Toast.LENGTH_SHORT).show();
                                }
                           }
                break;

                case R.id.txt_signup:
                    startActivity(new Intent(this, SignUp.class));
                    finish();
                    break;
            }
    }




}
