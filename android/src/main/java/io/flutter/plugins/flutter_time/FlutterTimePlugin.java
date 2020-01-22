package io.flutter.plugins.flutter_time;

import android.os.Build;
import android.provider.Settings;

import androidx.annotation.NonNull;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FlutterTimePlugin */
public class FlutterTimePlugin implements MethodCallHandler {

  private Registrar registrar;

  public FlutterTimePlugin(final Registrar registrar) {
    this.registrar = registrar;
  }

    // This static function is optional and equivalent to onAttachedToEngine. It supports the old
  // pre-Flutter-1.12 Android projects. You are encouraged to continue supporting
  // plugin registration via this function while apps migrate to use the new Android APIs
  // post-flutter-1.12 via https://flutter.dev/go/android-project-migration.
  //
  // It is encouraged to share logic between onAttachedToEngine and registerWith to keep
  // them functionally equivalent. Only one of onAttachedToEngine or registerWith will be called
  // depending on the user's project. onAttachedToEngine or registerWith must both be defined
  // in the same class.
  public static void registerWith(final Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_time");
    channel.setMethodCallHandler(new FlutterTimePlugin(registrar));
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("autoTimeIsEnable")) {
      result.success(autoTimeIsEnable());
    } else {
      result.notImplemented();
    }
  }

  private boolean autoTimeIsEnable() {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
      return Settings.Global.getInt(registrar.context().getContentResolver(), Settings.Global.AUTO_TIME, 0) == 1;
    }
    return Settings.System.getInt(registrar.context().getContentResolver(), Settings.System.AUTO_TIME, 0) == 1;
  }
}
