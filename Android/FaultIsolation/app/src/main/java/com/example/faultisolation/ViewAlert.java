package com.example.faultisolation;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.os.StrictMode;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.Toast;

import org.ksoap2.serialization.SoapObject;

import java.util.ArrayList;
import java.util.HashMap;

public class ViewAlert extends AppCompatActivity {
ListView lv_alert;
PreferenceHelper preferenceHelper;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view_alert);

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
        lv_alert=findViewById(R.id.listalert);
        preferenceHelper=new PreferenceHelper(this);
        listdata();

        lv_alert.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                HashMap<String, String> hmap=(HashMap<String, String>)parent.getItemAtPosition(position);
                Intent i=new Intent(getApplicationContext(), UpdateWork.class);
                i.putExtra("fault_id", hmap.get("a"));
                i.putExtra("alert", hmap.get("val"));
                startActivity(i);

            }
        });
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.dashboard, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();
        if (id == R.id.comid) {
            startActivity(new Intent(this, Complaint.class));

        }else if (id == R.id.fid) {
            startActivity(new Intent(this, Feedback.class));

        }else if(id==R.id.logid){
            logoutDialog();
        }
        return super.onOptionsItemSelected(item);
    }

    void listdata(){
        String val=new PreferenceHelper(ViewAlert.this).getString(Constants.UId);
        SoapObject sobj = new SoapObject(soapclass.NAMESPACE,"viewWork");
        soapclass sc = new soapclass();
        sobj.addProperty("uid", val);
        String ou = sc.Callsoap(sobj, "http://tempuri.org/viewWork");
       // Toast.makeText(getApplicationContext(),ou,Toast.LENGTH_LONG).show();
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
                    hmap.put("a", s2[0]);
                    hmap.put("b", s2[1]);
                    hmap.put("c",s2[2]);
                    hmap.put("d", s2[3]);
                    hmap.put("e", s2[4]);
//                    hmap.put("f",s2[5]);
//                    hmap.put("g", s2[6]);
//                    hmap.put("h", s2[7]);
//                    hmap.put("st", s2[8]);
                    String res="";
                    res="Work : "+s2[1]+"\n"+"Status : "+s2[4];
                    hmap.put("val",res);

                    allist.add(hmap);

                }
                ListAdapter lis=new SimpleAdapter(getApplicationContext(), allist, R.layout.notif, new String[] {"val","c","To date : "+"d"}, new int[] {R.id.txt11,R.id.txt22,R.id.txt33});
                lv_alert.setAdapter(lis);
                //Toast.makeText(getApplicationContext(), "Successfully Posted....", Toast.LENGTH_LONG).show();
            }catch (Exception e) {
                // TODO: handle exception
            }
        }
    }





    private void logoutDialog() {

        new AlertDialog.Builder(this)
                .setTitle("Confirmation")
                .setCancelable(false)
                .setMessage("Are you sure want to logout?")
                .setPositiveButton("Logout", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        preferenceHelper.putString(Constants.LOGIN_FLAG, "login_flag");
                        Intent intent = new Intent(getApplicationContext(), MainActivity.class);
                        intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
                        intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK);
                        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                        startActivity(intent);

                    }
                })
                .setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.dismiss();
                    }
                })
                .show();
    }

}
