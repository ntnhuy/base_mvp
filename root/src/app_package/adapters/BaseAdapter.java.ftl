package ${packageName}.adapters;

import android.support.v7.widget.RecyclerView;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by ntnhuy on 4/6/2016.
 */
public abstract class BaseAdapter<T> extends  RecyclerView.Adapter<RecyclerView.ViewHolder> {
    protected List<T> arrData;
    protected boolean mIsLoading = true;

    public BaseAdapter(){
        arrData = new ArrayList<>();
    }

    @Override
    public int getItemCount() {
        return arrData.size();
    }

    public T getItem(int position) {
        return arrData.get(position);
    }

    public void setItem(int position, T data) {
        if (0 <= position && position < arrData.size()) {
            arrData.set(position, data);
            notifyItemChanged(position);
            notifyDataSetChanged();
        }
    }

    public void addItems(List<T> data) {
        mIsLoading = false;
        arrData.addAll(data);
        notifyDataSetChanged();
    }

    public void addItem(T data) {
        arrData.add(data);
        notifyDataSetChanged();
    }

    public void addItem(int pos, T data) {
        arrData.add(pos, data);
        notifyItemInserted(pos);
    }

    public void remove(int position) {
        if (0 <= position && position < arrData.size()) {
            arrData.remove(position);
            notifyDataSetChanged();
        }
    }

    public void remove(T data) {
        try {
            arrData.remove(data);
            notifyDataSetChanged();
        } catch (Exception e) {

        }
    }

    public void removeAllItems() {
        mIsLoading = true;
        arrData.clear();
        notifyDataSetChanged();
    }
}
