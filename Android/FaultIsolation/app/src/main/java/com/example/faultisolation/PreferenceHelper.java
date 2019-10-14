package com.example.faultisolation;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * Created  on 07-10-2019.
 */

public class PreferenceHelper {

    Context context;

    public PreferenceHelper(Context context) {
        this.context = context;
    }

    public void putString(String key, String value) {
        SharedPreferences preferences = context.getSharedPreferences(
                Constants.PREF_NAME, Context.MODE_PRIVATE);
        preferences.edit().putString(key, value).commit();
    }

    public String getString(String key) {
        SharedPreferences preferences = context.getSharedPreferences(
                Constants.PREF_NAME, Context.MODE_PRIVATE);
        return preferences.getString(key, "");
    }

}
