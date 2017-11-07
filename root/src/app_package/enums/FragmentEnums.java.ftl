package ${packageName}.enums;

/**
 * Created by ntnhuy on 19/03/2016.
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
