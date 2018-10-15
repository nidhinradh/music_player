package me.nidhinradh.musicplayer;

import android.Manifest;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
  }

  @java.lang.Override
  protected void onResume() {
    super.onResume();
      if (ContextCompat.checkSelfPermission(MainActivity.this,
              Manifest.permission.RECORD_AUDIO)
              != PackageManager.PERMISSION_GRANTED) {
          ActivityCompat.requestPermissions(MainActivity.this,
                  new String[]{Manifest.permission.RECORD_AUDIO},
                  101);
      }
  }
}
