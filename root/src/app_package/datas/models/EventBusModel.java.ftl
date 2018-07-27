package ${packageName}.datas.models;

import ${packageName}.enums.EventBusEnum;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */
 
public class EventBusModel<T> {
    private EventBusEnum busEnum;
    private T data;

    public EventBusModel() {

    }

    public EventBusModel(EventBusEnum busEnum) {
        this.busEnum = busEnum;
    }

    public EventBusModel(EventBusEnum busEnum, T data) {
        this.busEnum = busEnum;
        this.data = data;
    }

    public EventBusEnum getBusEnum() {
        return busEnum;
    }

    public void setType(EventBusEnum busEnum) {
        this.busEnum = busEnum;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
