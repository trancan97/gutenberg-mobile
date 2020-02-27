package org.wordpress.mobile.react_native_overflow_view

import android.content.Context
import android.graphics.Point
import android.graphics.Rect
import android.view.MotionEvent
import android.view.View
import com.facebook.react.views.view.ReactViewGroup

class OverflowView(context: Context) : ReactViewGroup(context) {

    override fun onInterceptTouchEvent(ev: MotionEvent?): Boolean {
        val result = super.onInterceptTouchEvent(ev)
        return result
    }

    override fun onTouchEvent(ev: MotionEvent?): Boolean {
        val result = super.onTouchEvent(ev)
        return result
    }
}