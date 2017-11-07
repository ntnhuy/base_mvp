package ${packageName}.app.di.module;

import ${packageName}.datas.db.AppDbHelper;
import ${packageName}.datas.db.DbHelper;
import ${packageName}.app.di.DatabaseInfo;
import ${packageName}.utils.Constants;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;

/**
 * Created by tohuy on 9/17/17.
 */

@Module
public class DBModule {
    @Provides
    @DatabaseInfo
    String provideDatabaseName() {
        return Constants.CONFIG.DB_NAME;
    }

    @Provides
    @Singleton
    DbHelper provideDbHelper(AppDbHelper appDbHelper) {
        return appDbHelper;
    }
}
