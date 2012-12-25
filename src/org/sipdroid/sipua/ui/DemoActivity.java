package org.sipdroid.sipua.ui;

import org.sipdroid.sipua.R;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.EditText;

public class DemoActivity extends Activity {

	// Shared preference file name - !!!should be replaced by some system
	// variable!!!
	private final String sharedPrefsFile = "org.sipdroid.sipua_preferences";

	// Default values of the preferences
	public static final String DEFAULT_USERNAME = /* "8001" */"8003";
	public static final String DEFAULT_PASSWORD = /* "857259" */"123789";
	public static final String DEFAULT_SERVER = "210.56.60.150";
	public static final String DEFAULT_DOMAIN = "210.56.60.150";
	public static final boolean DEFAULT_WLAN = true;
	public static final boolean DEFAULT_3G = true;
	public static final boolean DEFAULT_EDGE = true;
	public static final String DEFAULT_STUN_SERVER = "stun.ekiga.net";
	public static final String DEFAULT_STUN_SERVER_PORT = "3478";

	// Call recording preferences.
	public static final String DEFAULT_DNS = "210.56.60.150";

	@Override
	protected void onStart() {
		super.onStart();

		Receiver.engine(this).registerMore();
	}

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.demo_activity_layout);

		SharedPreferences settings = getSharedPreferences(sharedPrefsFile,
				MODE_PRIVATE);

		Editor edit0 = settings.edit();

		edit0.putString(Settings.PREF_USERNAME, DEFAULT_USERNAME);
		edit0.putString(Settings.PREF_PASSWORD, DEFAULT_PASSWORD);
		edit0.putString(Settings.PREF_SERVER, DEFAULT_SERVER);
		edit0.putString(Settings.PREF_DOMAIN, DEFAULT_DOMAIN);
		edit0.putString(Settings.PREF_DNS, DEFAULT_DNS);

		edit0.putBoolean(Settings.PREF_WLAN, DEFAULT_WLAN);
		edit0.putBoolean(Settings.PREF_3G, DEFAULT_3G);
		edit0.putBoolean(Settings.PREF_EDGE, DEFAULT_EDGE);
		edit0.commit();

		findViewById(R.id.hello_world_button).setOnClickListener(
				new DemoBtnOnClickListener());

		findViewById(R.id.call_button).setOnClickListener(
				new OnClickListener() {

					@Override
					public void onClick(View v) {
						// get callee phone number
						String _calleePhone = "86"
								+ ((EditText) findViewById(R.id.callee_editText))
										.getText().toString();

						Receiver.engine(DemoActivity.this).call(_calleePhone,
								true);
					}
				});
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		getMenuInflater().inflate(R.menu.demo_activity_layout, menu);
		return true;
	}

	public static boolean on(Context context) {
		return PreferenceManager.getDefaultSharedPreferences(context)
				.getBoolean(Settings.PREF_ON, Settings.DEFAULT_ON);
	}

	public static void on(Context context, boolean on) {
		Editor edit = PreferenceManager.getDefaultSharedPreferences(context)
				.edit();
		edit.putBoolean(Settings.PREF_ON, on);
		edit.commit();
		if (on)
			Receiver.engine(context).isRegistered();
	}

	// inner class
	class DemoBtnOnClickListener implements OnClickListener {

		@Override
		public void onClick(View v) {
			on(DemoActivity.this, false);
			Receiver.pos(true);
			Receiver.engine(DemoActivity.this).halt();
			Receiver.mSipdroidEngine = null;
			Receiver.reRegister(0);
			stopService(new Intent(DemoActivity.this, RegisterService.class));

			finish();
		}

	}

}
