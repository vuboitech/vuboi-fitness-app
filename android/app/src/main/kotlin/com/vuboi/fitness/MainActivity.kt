package com.vuboi.fitness

import android.content.Context
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import android.os.Bundle
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import kotlin.random.Random


class MainActivity: FlutterActivity(), SensorEventListener {

    private lateinit var sensorManager: SensorManager

    private val CHANNEL = "flutter.native/helper"

    private var heartRateResult = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        intent.putExtra("background_mode", "transparent")
        super.onCreate(savedInstanceState)

        Log.d("Im alive", "aliveee")

        sensorManager = getSystemService(Context.SENSOR_SERVICE) as SensorManager
        val heartRateSensor = sensorManager.getDefaultSensor(Sensor.TYPE_HEART_RATE)

        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getRandomNumber") {

                val sensorRegistered: Boolean = sensorManager.registerListener(
                    this,
                    heartRateSensor,
                    SensorManager.SENSOR_DELAY_FASTEST
                )

                result.success(" Sensor registered: " + if (sensorRegistered) "yes" else "no")
            }
            else if (call.method == "getHeartRate") {
                result.success(heartRateResult)
            }
            else {
                result.notImplemented()
            }
        }
    }

    override fun onSensorChanged(event: SensorEvent?) {
        val mHeartRateFloat = event!!.values[0]

        val mHeartRate = Math.round(mHeartRateFloat)

        heartRateResult = mHeartRate
        Log.d("Sensor Status:", " Heart rate: $mHeartRate")
    }

    override fun onPause() {
        super.onPause()
        sensorManager.unregisterListener(this)
    }

    override fun onAccuracyChanged(sensor: Sensor?, accuracy: Int) {
        Log.d("TAG", "onAccuracyChanged - accuracy: " + accuracy);
    }

//    override fun onGenericMotionEvent(event: MotionEvent?): Boolean {
//        return when {
//            WearableRotaryPlugin.onGenericMotionEvent(event) -> true
//            else -> super.onGenericMotionEvent(event)
//        }
//    }
}
