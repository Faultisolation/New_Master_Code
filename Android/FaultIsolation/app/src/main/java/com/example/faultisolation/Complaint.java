package com.example.faultisolation;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.os.StrictMode;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.Toast;

import org.ksoap2.serialization.SoapObject;

import java.util.ArrayList;
import java.util.HashMap;

public class Complaint extends AppCompatActivity  implements View.OnClickListener{
    EditText et_complaint;
    Button bt_post;
    ListView lv_com;
    PreferenceHelper preferenceHelper;
    String val;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_complaint);

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
        et_complaint=findViewById(R.id.ed_comp);
        lv_com=findViewById(R.id.lv_list);
        bt_post=findViewById(R.id.bt_post);
        bt_post.setOnClickListener(this);
        preferenceHelper = new PreferenceHelper(this);
         val=new PreferenceHelper(Complaint.this).getString(Constants.UId);

        listdata();

    }

    @Override
    public void onClick(View v) {
        if(!et_complaint.getText().toString().equals("")) {

            SoapObject sobj = new SoapObject(soapclass.NAMESPACE, "complaints");
            soapclass sc = new soapclass();
            sobj.addProperty("uid", val);
            sobj.addProperty("comp", et_complaint.getText().toString());
            sobj.addProperty("type", MainActivity.type);
            String ou = sc.Callsoap(sobj, "http://tempuri.org/complaints");
            if (ou.equals("error")) {
                Toast.makeText(getApplicationContext(), "Try Again....", Toast.LENGTH_LONG).show();
            } else {
                Toast.makeText(getApplicationContext(), "Successfully Posted....", Toast.LENGTH_LONG).show();
            }
        }
        else{
            et_complaint.setError("Complaint field is required");
            et_complaint.requestFocus();
        }

    }


    void listdata(){
        SoapObject sobj = new SoapObject(soapclass.NAMESPACE,"reply");
        soapclass sc = new soapclass();
        sobj.addProperty("uid", val);
        String ou = sc.Callsoap(sobj, "http://tempuri.org/reply");
        if(!ou.equals("error"))
        {
            try
            {
                ArrayList<HashMap<String,String>> allist=new ArrayList<HashMap<String, String>>();
                String []s1=ou.split("@");
                for(int i=0;i<s1.length;i++)
                {
                    String []s2=s1[i].split("#");
                    HashMap<String,String>hmap=new HashMap<String,String>();

                    hmap.put("b", s2[0]+" : "+s2[1]);
                    hmap.put("c",s2[2]);

                    allist.add(hmap);

                }
                ListAdapter lis=new SimpleAdapter(getApplicationContext(), allist, R.layout.complaint_raw_item, new String[] {"b","c"}, new int[] {R.id.txt1,R.id.txt2});
                lv_com.setAdapter(lis);
                //Toast.makeText(getApplicationContext(), "Successfully Posted....", Toast.LENGTH_LONG).show();
            }catch (Exception e) {
                // TODO: handle exception
            }
        }
    }
}
