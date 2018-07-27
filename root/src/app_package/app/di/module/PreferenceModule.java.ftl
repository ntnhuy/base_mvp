package ${packageName}.app.di.module;

import ${packageName}.app.di.PreferenceInfo;
import ${packageName}.datas.prefs.AppPreferencesHelper;
import ${packageName}.datas.prefs.PreferencesHelper;
import ${packageName}.utils.Constants;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
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
