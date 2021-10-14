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
    override fun onUpdate(context: Context, appWidgetManager: AppWidgetManager, appWidgetIds: IntArray, widgetData: SharedPreferences) {
        appWidgetIds.forEach { widgetId ->
            val views = RemoteViews(context.packageName, R.layout.widget_layout).apply {

                // Open App on Widget Click
                val pendingIntent = HomeWidgetLaunchIntent.getActivity(context,
                        MainActivity::class.java)
                setOnClickPendingIntent(R.id.widget_root, pendingIntent)

                val counter = widgetData.getString("_counter", "0")

                var counterText = "Your: $counter"

                if (counter == "0") {
                    counterText = "You have not pressed the counter button"
                }

                 //

                setTextViewText(R.id.tv_counter, counterText)

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