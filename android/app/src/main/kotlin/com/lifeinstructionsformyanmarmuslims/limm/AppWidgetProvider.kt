package com.lifeinstructionsformyanmarmuslims.limm
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

                val prayerTimes = widgetData.getString("prayerTime", null) 
                val data = prayerTimes?.split(",")
                setTextViewText(R.id.tvFajrTime, data?.getOrNull(0)  ?: "-")
                setTextViewText(R.id.tvSunriseTime, data?.getOrNull(1)  ?: "-")
                setTextViewText(R.id.tvDuhrTime, data?.getOrNull(2)  ?: "-")
                setTextViewText(R.id.tvAsrTime, data?.getOrNull(3)  ?: "-")
                setTextViewText(R.id.tvMagribTime, data?.getOrNull(4)  ?: "-")
                setTextViewText(R.id.tvIshaTime, data?.getOrNull(5)  ?: "-")
                



                // Pending intent to update counter on button click
//                val backgroundIntent = HomeWidgetBackgroundIntent.getBroadcast(context,
//                        Uri.parse("myAppWidget://refreshClicked"))
//
//                setOnClickPendingIntent(R.id.imgRefresh, backgroundIntent)


            }
            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}