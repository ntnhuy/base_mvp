package ${packageName}.widgets;

import android.graphics.Rect;
import android.support.v7.widget.RecyclerView;
import android.view.View;

public class SpacingItemDecoration extends RecyclerView.ItemDecoration {
    private int left;
    private int top;
    private int right;
    private int bottom;


    public SpacingItemDecoration(int left, int top, int right, int bottom) {
        this.left = left;
        this.top = top;
        this.right = right;
        this.bottom = bottom;
    }

    @Override
    public void getItemOffsets(Rect outRect, View view,
                               RecyclerView parent, RecyclerView.State state) {
        final int itemPosition = parent.getChildAdapterPosition(view);
        if (itemPosition == RecyclerView.NO_POSITION) {
            return;
        }

        final int itemCount = state.getItemCount();

        /** first position */
        if (itemPosition == 0) {
            outRect.set(left, 0, right, bottom);
        }
        /** last position */
        else if (itemCount > 0 && itemPosition == itemCount - 1) {
            outRect.set(left, top, right, 0);
        }
        /** positions between first and last */
        else {
            outRect.set(left, top, right, bottom);
        }
    }
}
