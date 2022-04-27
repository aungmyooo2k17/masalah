package com.example.masalah
import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.net.Uri
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetBackgroundIntent
import es.antonborri.home_widget.HomeWidgetLaunchIntent
import es.antonborri.home_widget.HomeWidgetProvider
import java.util.TimerTask

import java.util.Timer


class AppWidgetProvider : HomeWidgetProvider() {

    override fun onUpdate(context: Context,
                          appWidgetManager: AppWidgetManager,
                          appWidgetIds: IntArray,
                          widgetData: SharedPreferences) {
        appWidgetIds.forEach { widgetId ->
            val views = RemoteViews(context.packageName, R.layout.widget_layout).apply {




                // Open App on Widget Click
                val pendingIntent = HomeWidgetLaunchIntent.getActivity(context,
                        MainActivity::class.java)
                setOnClickPendingIntent(R.id.widget_root, pendingIntent)

                val prayerTimes = widgetData.getString("prayerTime", null) ?: ""
                val data = prayerTimes.split(",") ?: listOf()
                setTextViewText(R.id.tvFajrTime, data[0]  ?: "-")
                setTextViewText(R.id.tvSunriseTime, data[1]  ?: "-")
                setTextViewText(R.id.tvDuhrTime, data[2]  ?: "-")
                setTextViewText(R.id.tvAsrTime, data[3]  ?: "-")
                setTextViewText(R.id.tvMagribTime, data[4]  ?: "-")
                setTextViewText(R.id.tvIshaTime, data[5]  ?: "-")
                



                // Pending intent to update counter on button click
                val backgroundIntent = HomeWidgetBackgroundIntent.getBroadcast(context,
                        Uri.parse("myAppWidget://updatecounter"))

                setOnClickPendingIntent(R.id.llRefresh, backgroundIntent)

                val timer = Timer()
                timer.schedule(object : TimerTask() {
                    override fun run() {
                        //what you want to do

                    }
                }, 0, 15000)
            }
            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}