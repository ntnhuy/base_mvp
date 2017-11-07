package ${packageName}.datas.db;

import android.content.Context;

import ${packageName}.datas.models.DaoMaster;
import ${packageName}.app.di.ApplicationContext;
import ${packageName}.app.di.DatabaseInfo;

import org.greenrobot.greendao.database.Database;

import javax.inject.Inject;

/**
 * Created by tohuy on 9/17/17.
 */

public class DbOpenHelper extends DaoMaster.OpenHelper {

    @Inject
    public DbOpenHelper(@ApplicationContext Context context, @DatabaseInfo String name) {
        super(context, name);
    }

    @Override
    public void onUpgrade(Database db, int oldVersion, int newVersion) {
        super.onUpgrade(db, oldVersion, newVersion);
        switch (oldVersion) {
            case 1:
            case 2:
                //db.execSQL("ALTER TABLE " + UserDao.TABLENAME + " ADD COLUMN "
                // + UserDao.Properties.Name.columnName + " TEXT DEFAULT 'DEFAULT_VAL'");
        }
    }
}
