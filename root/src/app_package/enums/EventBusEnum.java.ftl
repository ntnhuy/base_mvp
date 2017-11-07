package ${packageName}.enums;

/**
 * Created by ntnhuy on 21/12/2016.
 */

public enum EventBusEnum {
    NONE("-1");

    private String key;

    EventBusEnum(String key) {
        this.key = key;
    }

    public static EventBusEnum toEventBusEnum(String myEnumString) {
        try {
            switch (myEnumString) {

            }

            return valueOf(myEnumString);
        } catch (Exception ex) {
            // For error cases
            return NONE;
        }
    }

    public String getKey() {
        return key;
    }
}
