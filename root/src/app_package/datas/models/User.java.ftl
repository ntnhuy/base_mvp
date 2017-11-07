package ${packageName}.datas.models;

import org.greenrobot.greendao.annotation.Convert;
import org.greenrobot.greendao.annotation.Entity;
import org.greenrobot.greendao.annotation.Id;
import org.greenrobot.greendao.annotation.Index;
import org.greenrobot.greendao.annotation.NotNull;
import org.greenrobot.greendao.converter.PropertyConverter;
import org.greenrobot.greendao.annotation.Generated;

import ${packageName}.app.bases.BaseModel;

/**
 * Created by tohuy on 10/31/17.
 */

@Entity(indexes = {
        @Index(value = "username, id DESC", unique = true)
})
public class User extends BaseModel {

    @Id
    private Long id;

    @NotNull
    private String username;

    @NotNull
    private String password;

    @Convert(converter = RoleConverter.class, columnType = Integer.class)
    private Role role;

    @Generated(hash = 586692638)
    public User() {
    }



    @Generated(hash = 1090089657)
    public User(Long id, @NotNull String username, @NotNull String password,
                Role role) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
    }



    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Role getRole() {
        return this.role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public enum Role {
        DEFAULT(0), AUTHOR(1), ADMIN(2);

        final int id;

        Role(int id) {
            this.id = id;
        }
    }

    public static class RoleConverter implements PropertyConverter<Role, Integer> {
        @Override
        public Role convertToEntityProperty(Integer databaseValue) {
            if (databaseValue == null) {
                return null;
            }
            for (Role role : Role.values()) {
                if (role.id == databaseValue) {
                    return role;
                }
            }
            return Role.DEFAULT;
        }

        @Override
        public Integer convertToDatabaseValue(Role entityProperty) {
            return entityProperty == null ? null : entityProperty.id;
        }
    }
}
