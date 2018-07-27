package ${packageName}.datas.rx;

import io.reactivex.Scheduler;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */
 
public interface SchedulerProvider {

    Scheduler ui();

    Scheduler computation();

    Scheduler io();

}
