package com.localstorage

import android.content.Context
import android.content.SharedPreferences
import com.facebook.fbreact.specs.NativeLocalStorageSpec
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.module.annotations.ReactModule
import androidx.core.content.edit

@ReactModule(name = LocalStorageModule.NAME)
class LocalStorageModule(reactContext: ReactApplicationContext) :
  NativeLocalStorageSpec(reactContext) {

  private val sharedPreferences: SharedPreferences =
    reactContext.getSharedPreferences("local-storage", Context.MODE_PRIVATE)

  override fun getName(): String = NAME

  override fun setItem(value: String, key: String) {
    sharedPreferences.edit { putString(key, value) }
  }

  override fun getItem(key: String): String? {
    return sharedPreferences.getString(key, null)
  }

  override fun removeItem(key: String) {
    sharedPreferences.edit { remove(key) }
  }

  override fun clear() {
    sharedPreferences.edit { clear() }
  }

  companion object {
    const val NAME = "LocalStorage"
  }
}
