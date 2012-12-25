package org.sipdroid.sipua.ui;

import org.sipdroid.sipua.R;
import org.sipdroid.sipua.phone.Call;

import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;

public class OutgoingCallActivity extends Activity {

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.outgoing_call_activity_layout);

		findViewById(R.id.hangup_button).setOnClickListener(
				new OnClickListener() {

					@Override
					public void onClick(View v) {
						reject();
					}
				});
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		getMenuInflater().inflate(R.menu.outgoing_call_activity_layout, menu);
		return true;
	}

	private void reject() {
		if (Receiver.ccCall != null) {
			Receiver.stopRingtone();
			Receiver.ccCall.setState(Call.State.DISCONNECTED);
		}
		(new Thread() {
			public void run() {
				Receiver.engine(OutgoingCallActivity.this).rejectcall();
			}
		}).start();
	}

}
