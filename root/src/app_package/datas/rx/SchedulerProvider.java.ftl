package ${packageName}.datas.rx;

import io.reactivex.Scheduler;

/**
 * Created by tohuy on 9/17/17.
 */

public interface SchedulerProvider {

    Scheduler ui();

    Scheduler computation();

    Scheduler io();

}
