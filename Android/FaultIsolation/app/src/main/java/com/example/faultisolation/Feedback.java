package com.example.faultisolation;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.os.StrictMode;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import org.ksoap2.serialization.SoapObject;

public class Feedback extends AppCompatActivity  implements View.OnClickListener {
EditText ed;
Button post;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_feedback);

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

        initdata();

    }

    private void initdata() {
        ed=findViewById(R.id.ed_feedback);
        post=findViewById(R.id.bt_fdpost);

        post.setOnClickListener(this);
    }

    @Override
    public void onClick(View view) {
        String val=new PreferenceHelper(Feedback.this).getString(Constants.UId);
        if(!ed.getText().toString().equals("")) {

            SoapObject sobj = new SoapObject(soapclass.NAMESPACE, "feedback");
            soapclass sc = new soapclass();
            sobj.addProperty("eid", val);
            sobj.addProperty("fdbk", ed.getText().toString());
            String ou = sc.Callsoap(sobj, "http://tempuri.org/feedback");
            if (ou.equals("error") || ou.equals("")) {
                Toast.makeText(getApplicationContext(), "Try Again....", Toast.LENGTH_LONG).show();
            } else {
                Toast.makeText(getApplicationContext(), "Successfully Posted....", Toast.LENGTH_LONG).show();
            }
        }
        else{
            ed.setError("Feedback field is required");
            ed.requestFocus();
        }

    }
}
