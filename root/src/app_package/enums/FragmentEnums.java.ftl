package ${packageName}.enums;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */
 
public enum FragmentEnums {
    HOME("HOME");

    private String fragmentName;

    FragmentEnums(String name) {
        this.fragmentName = name;
    }

    public String getFragmentName() {
        return this.fragmentName;
    }
}
