package ${packageName}.datas.db;

import io.reactivex.Observable;

import ${packageName}.datas.models.User;

import java.util.List;

/**
 * Created by tohuy on 9/17/17.
 */

public interface DbHelper {

    Observable<Boolean> clearDB();

    Observable<Long> insertUser(final User user);

    Observable<Boolean> insertInTx(List<User> users);

    Observable<List<User>> getAllUsers();

    Observable<List<User>> getUsers(String email, String password);
}
