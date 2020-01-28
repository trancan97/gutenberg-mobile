package org.wordpress.mobile.react_native_overflow_view

import android.content.Context
import android.graphics.Point
import android.graphics.Rect
import android.view.MotionEvent
import android.view.View
import com.facebook.react.views.view.ReactViewGroup

class OverflowView(context: Context) : ReactViewGroup(context) {

    override fun onInterceptTouchEvent(ev: MotionEvent?): Boolean {
        return super.onInterceptTouchEvent(ev)
    }

    override fun getChildVisibleRect(child: View?, r: Rect?, offset: Point?): Boolean {
        var result = super.getChildVisibleRect(child, r, offset)
        return result
    }
}