package ${packageName}.helper;

import android.databinding.BindingAdapter;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.support.design.widget.TabLayout;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v7.widget.RecyclerView;
import android.widget.ImageView;
import ${packageName}.adapters.BaseAdapter;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */
 
public class DataBindingHelper {
    @BindingAdapter("initViewPager")
    public static void initViewPager(ViewPager viewPager, PagerAdapter adapter) {
        viewPager.setAdapter(adapter);
    }

    @BindingAdapter(value = {"title", "selectTab", "unSelectLastActiveTab"})
    public static void setupTabLayout(TabLayout tabLayout, String[] str, final Runnable selectTab, final Runnable unSelectLastActiveTab) {
        for (int i = 0; i < str.length; i++) {
            tabLayout.addTab(tabLayout.newTab().setText(str[i]));
        }
        tabLayout.addOnTabSelectedListener(new TabLayout.OnTabSelectedListener() {
            @Override
            public void onTabSelected(TabLayout.Tab tab) {
                unSelectLastActiveTab.run();
                selectTab.run();
            }

            @Override
            public void onTabUnselected(TabLayout.Tab tab) {
                unSelectLastActiveTab.run();
            }

            @Override
            public void onTabReselected(TabLayout.Tab tab) {
                onTabSelected(tab);
            }
        });
    }

    @BindingAdapter("initRecyclerView")
    public static void initRecyclerView(RecyclerView recyclerView, BaseAdapter adapter) {
        recyclerView.setAdapter(adapter);
    }

    @BindingAdapter("itemDecoration")
    public static void addItemDecoration(RecyclerView rcv, RecyclerView.ItemDecoration itemDecoration) {
        rcv.addItemDecoration(itemDecoration);
    }

    @BindingAdapter("android:src")
    public static void setImageUri(ImageView view, String imageUri) {
        if (imageUri == null) {
            view.setImageURI(null);
        } else {
            view.setImageURI(Uri.parse(imageUri));
        }
    }

    @BindingAdapter("android:src")
    public static void setImageUri(ImageView view, Uri imageUri) {
        view.setImageURI(imageUri);
    }

    @BindingAdapter("android:src")
    public static void setImageDrawable(ImageView view, Drawable drawable) {
        view.setImageDrawable(drawable);
    }

    @BindingAdapter("android:src")
    public static void setImageResource(ImageView imageView, int resource){
        imageView.setImageResource(resource);
    }
}
