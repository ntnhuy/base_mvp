package ${packageName}.enums;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
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
