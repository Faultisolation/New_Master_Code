package com.example.faultisolation;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.os.StrictMode;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.TextView;
import android.widget.Toast;

import org.ksoap2.serialization.SoapObject;

public class UpdateWork extends AppCompatActivity implements View.OnClickListener {
TextView txt_alert;
Button bt_submit,btn_update;
EditText et_inf;
RadioButton r1,r2,r3,r4,r5;
String fault_id="",alert="";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_update_work);
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
        initData();

    }

    private void initData() {
        txt_alert=findViewById(R.id.txt_alert);
        bt_submit=findViewById(R.id.bt_submit);
        btn_update=findViewById(R.id.btn_update);
        et_inf=findViewById(R.id.et_informtime);
        r1=findViewById(R.id.radioButton);
        r2=findViewById(R.id.radioButton2);
        r3=findViewById(R.id.radioButton3);
        r4=findViewById(R.id.radioButton4);
        r5=findViewById(R.id.radioButton5);

        fault_id=getIntent().getStringExtra("fault_id");
        alert=getIntent().getStringExtra("alert");


        txt_alert.setText(alert);

        bt_submit.setOnClickListener(this);
        btn_update.setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {
switch (v.getId()) {
    case R.id.bt_submit:
    String sts = "";

    if (r1.isChecked() == true) {
        sts = r1.getText().toString();
    } else if (r2.isChecked() == true) {
        sts = r2.getText().toString();
    } else if (r3.isChecked() == true) {
        sts = r3.getText().toString();
    } else if (r4.isChecked() == true) {
        sts = r4.getText().toString();
    } else if (r5.isChecked() == true) {
        sts = r5.getText().toString();
    } else {
        sts = "";
    }


    if (!sts.equals("")) {

        SoapObject sobj = new SoapObject(soapclass.NAMESPACE, "update_status");
        soapclass sc = new soapclass();
        sobj.addProperty("fault_id", fault_id);
        sobj.addProperty("sts", sts);
        String ou = sc.Callsoap(sobj, "http://tempuri.org/update_status");
        if (ou.equals("error")) {
            Toast.makeText(getApplicationContext(), "Try Again....", Toast.LENGTH_LONG).show();
        } else {
            Toast.makeText(getApplicationContext(), "Successfully Posted....", Toast.LENGTH_LONG).show();
        }
    } else {
        Toast.makeText(getApplicationContext(), "No status selected", Toast.LENGTH_LONG).show();
    }
    break;

    case R.id.btn_update:

        if (!et_inf.getText().toString().equals("")) {
            String val=new PreferenceHelper(UpdateWork.this).getString(Constants.UId);
            SoapObject sobj = new SoapObject(soapclass.NAMESPACE, "update_status");
            soapclass sc = new soapclass();
            sobj.addProperty("fault_id", fault_id);
            sobj.addProperty("uid", val);
            sobj.addProperty("tme", et_inf.getText().toString());
            String ou = sc.Callsoap(sobj, "http://tempuri.org/update_status");
            if (ou.equals("error")) {
                Toast.makeText(getApplicationContext(), "Try Again....", Toast.LENGTH_LONG).show();
            } else {
                Toast.makeText(getApplicationContext(), "Successfully Posted....", Toast.LENGTH_LONG).show();
            }
        } else {
            et_inf.setError("Field empty");
            et_inf.requestFocus();
        }

}
    }
}
