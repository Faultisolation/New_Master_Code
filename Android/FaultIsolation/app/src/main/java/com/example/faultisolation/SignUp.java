package com.example.faultisolation;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.os.StrictMode;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;

import org.ksoap2.serialization.SoapObject;

public class SignUp extends AppCompatActivity implements View.OnClickListener{
EditText e2,e4,e5,e6,e8;
Spinner s8;
Button b;
String slected_dept;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sign_up);

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

        e2=findViewById(R.id.editText2);
        e4=findViewById(R.id.editText4);
        e5=findViewById(R.id.editText5);
        e6=findViewById(R.id.editText6);
        e8=findViewById(R.id.editText8);

        s8=findViewById(R.id.spinner7);

        b=findViewById(R.id.button2);

        b.setOnClickListener(this);
    }

    @Override
    public void onClick(View view) {
        if(e2.getText().toString().equals("")){
            e2.setError("Name field is required");
            e2.requestFocus();
        }else if(e4.getText().toString().equals("")){
            e4.setError("Email field is required");
            e4.requestFocus();
        }else if(e5.getText().toString().equals("")){
            e5.setError("Mobile field is required");
            e5.requestFocus();
        }else if(e6.getText().toString().equals("")){
            e6.setError("location field is required");
            e6.requestFocus();
        }else if(s8.getSelectedItem().toString().equals("select")){
            s8.requestFocus();
        }else if(e8.getText().toString().equals("")){
            e8.setError("Password field is required");
            e8.requestFocus();
        }else {
            SoapObject obj = new SoapObject(soapclass.NAMESPACE, "signup");
            obj.addProperty("name", e2.getText().toString());
            obj.addProperty("dept", s8.getSelectedItem().toString());
            obj.addProperty("location", e6.getText().toString());
            obj.addProperty("contact", e5.getText().toString());
            obj.addProperty("email", e4.getText().toString());
            obj.addProperty("password", e8.getText().toString());
            soapclass sc = new soapclass();
            String ou = sc.Callsoap(obj, "http://tempuri.org/signup");
            // Toast.makeText(getApplicationContext(), ou, Toast.LENGTH_SHORT).show();
            if (!ou.equals("error") && !ou.equals("")) {

                    Toast.makeText(getApplicationContext(), "Registered Successfully", Toast.LENGTH_SHORT).show();

            } else {
                Toast.makeText(getApplicationContext(), "Registration failed", Toast.LENGTH_SHORT).show();
            }
        }
    }
}
