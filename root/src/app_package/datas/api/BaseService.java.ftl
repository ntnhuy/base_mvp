package ${packageName}.datas.api;

import android.app.Activity;

import ${packageName}.${classApplication};
import ${packageName}.BuildConfig;
import ${packageName}.utils.ToStringConverterFactory;

import okhttp3.Cache;
import okhttp3.OkHttpClient;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

/**
 * Created by ntnhuy on 18/04/2016.
 */
public class ${classApplication}Service {
    public static Activity context;
    private static Retrofit retrofit;

    public static ApiHelper getApiInstance() {
        if (retrofit == null) {
            final OkHttpClient okHttpClient = new OkHttpClient();

            // Enable caching for OkHttp
            int cacheSize = 10 * 1024 * 1024; // 10 MiB
            Cache cache = new Cache(${classApplication}.getInstance().getCacheDir(), cacheSize);
            okHttpClient.newBuilder().cache(cache);


            okHttpClient.interceptors().add(new ${classApplication}RequestInterceptor());

//            okHttpClient.setReadTimeout(60, TimeUnit.SECONDS);
//            okHttpClient.setConnectTimeout(60, TimeUnit.SECONDS);
            retrofit = new Retrofit.Builder()
                    .baseUrl(BuildConfig.BASE_URL)
                    .addConverterFactory(new ToStringConverterFactory())
                    .addConverterFactory(GsonConverterFactory.create())
                    .client(okHttpClient)
                    .build();
        }
        return retrofit.create(ApiHelper.class);
    }
}

