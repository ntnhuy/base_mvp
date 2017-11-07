package ${packageName}.utils;

/**
 * Created by ntnhuy on 03/03/16.
 */
public class Constants {

    public final static String EMPTY = "";

    public abstract static class SPK {
        public static final String NAME = "MYAPP";
        public static final String IS_FIRST_INSTALL_APP = "is first install app";
        public static final String IS_LOGIN = "is login";
    }

    public abstract static class BUNDLEKEY {

    }

    public abstract static class CONFIG {
        public static final int MIN_PASSWORD = 8;
        /**
         * A flag to show how easily you can switch from standard SQLite to the encrypted SQLCipher.
         */
        public static final boolean ENCRYPTED = true;
        public static final String DB_NAME = "base_mvp.db";
    }

    public abstract static class TAB {
        public static final int TAB1 = 0;
        public static final int TAB2 = 1;
    }
}
