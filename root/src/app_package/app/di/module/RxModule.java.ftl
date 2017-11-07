package ${packageName}.app.di.module;

import ${packageName}.datas.rx.AppSchedulerProvider;
import ${packageName}.datas.rx.SchedulerProvider;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;
import io.reactivex.disposables.CompositeDisposable;

/**
 * Created by tohuy on 9/17/17.
 */

@Module
public class RxModule {
    @Provides
    @Singleton
    CompositeDisposable provideCompositeDisposable() {
        return new CompositeDisposable();
    }

    @Provides
    @Singleton
    SchedulerProvider provideSchedulerProvider() {
        return new AppSchedulerProvider();
    }
}
