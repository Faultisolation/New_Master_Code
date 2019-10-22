package com.example.notificationfault;

import android.os.Bundle;
import android.app.Activity;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.TaskStackBuilder;
import android.content.Context;
import android.content.Intent;
import android.support.v4.app.INotificationSideChannel;
import android.view.View;
import android.widget.Button;

import androidx.core.app.NotificationCompat;


public class MainActivity extends Activity {
    Button Start;
    NotificationCompat.Builder notification;
    PendingIntent pIntent;
    NotificationManager manager;
    Intent resultIntent;
    TaskStackBuilder stackBuilder;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Start = (Button)findViewById(R.id.start);
        Start.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View arg0) {
                // TODO Auto-generated method stub

                startNotification();

            }

            protected void startNotification() {
                // TODO Auto-generated method stub
                //Creating Notification Builder
                notification = new NotificationCompat.Builder(MainActivity.this);
                //Title for Notification
                notification.setContentTitle("Learn2Crack Updates");
                //Message in the Notification
                notification.setContentText("New Post on Android Notification.");
                //Alert shown when Notification is received
                notification.setTicker("New Message Alert!");
                //Icon to be set on Notification
                notification.setSmallIcon(R.drawable.ic_launcher_background);
                //Creating new Stack Builder
                stackBuilder = TaskStackBuilder.create(MainActivity.this);
                stackBuilder.addParentStack(Result.class);
                //Intent which is opened when notification is clicked
                resultIntent = new Intent(MainActivity.this, Result.class);
                stackBuilder.addNextIntent(resultIntent);
                pIntent =  stackBuilder.getPendingIntent(0,PendingIntent.FLAG_UPDATE_CURRENT);
                notification.setContentIntent(pIntent);
                manager =(NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
                manager.notify(0, notification.build());

            }
        });
    }

}