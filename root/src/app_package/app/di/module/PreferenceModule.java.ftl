package ${packageName}.app.di.module;

import ${packageName}.app.di.PreferenceInfo;
import ${packageName}.datas.prefs.AppPreferencesHelper;
import ${packageName}.datas.prefs.PreferencesHelper;
import ${packageName}.utils.Constants;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;

/**
 * Created by tohuy on 9/22/17.
 */

@Module
public class PreferenceModule {
    @Provides
    @PreferenceInfo
    String providePreferenceName() {
        return Constants.SPK.NAME;
    }

    @Provides
    @Singleton
    PreferencesHelper providePreferencesHelper(AppPreferencesHelper appPreferencesHelper) {
        return  appPreferencesHelper;
    }
}
