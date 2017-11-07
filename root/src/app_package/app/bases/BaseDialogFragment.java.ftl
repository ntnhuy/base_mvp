package ${packageName}.app.bases;

import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.FragmentManager;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

import ${packageName}.${classApplication};
import ${packageName}.app.di.component.DaggerFragmentComponent;
import ${packageName}.app.di.component.FragmentComponent;
import ${packageName}.widgets.ButtonPlus;
import ${packageName}.widgets.TextViewPlus;

import butterknife.ButterKnife;

public abstract class BaseDialogFragment extends DialogFragment implements MvpView {

    protected View inflaterView;

    protected TextViewPlus tvTitle;
    protected ImageView ivLeft;
    protected ImageView ivRight;
    protected ButtonPlus btnCancel;
    protected ButtonPlus btnOk;

    protected FragmentManager childFragmentManager;
    protected FragmentManager parentFragmentManager;
    protected FragmentManager mainFragmentManager;

    protected BaseActivity activity;
    private FragmentComponent fragmentComponent;

    protected abstract int getLayoutRes();

    protected abstract int getIdResContainView();

    protected abstract int getIdBtnCancel();

    protected abstract int getIdBtnOK();

    protected abstract int getIdIvLeft();

    protected abstract int getIdIvRight();

    protected abstract int getIdTvTitle();

    protected abstract void initVariable();

    protected abstract void initView(View view, Bundle saveInstanceBundle);

    protected abstract void initListener(View view, Bundle savedInstanceState);

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        activity = (BaseActivity) getActivity();

        fragmentComponent = DaggerFragmentComponent.builder()
                .appComponent(${classApplication}.getInstance().getAppComponent())
                .build();
        fragmentComponent.inject(this);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, Bundle savedInstanceState) {
        getDialog().getWindow().setLayout((int)(getResources().getDisplayMetrics().widthPixels*0.90), (int)(getResources().getDisplayMetrics().heightPixels*0.90));
        getDialog().getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
        mainFragmentManager = getActivity().getSupportFragmentManager();
        parentFragmentManager = getFragmentManager();
        childFragmentManager = getChildFragmentManager();
        if (inflaterView == null) {
            inflaterView = inflater.inflate(getLayoutRes(), container, false);
            tvTitle = (TextViewPlus) inflaterView.findViewById(getIdTvTitle());
            ivRight = (ImageView) inflaterView.findViewById(getIdIvRight());
            ivLeft = (ImageView) inflaterView.findViewById(getIdIvLeft());
            btnOk = (ButtonPlus) inflaterView.findViewById(getIdBtnOK());
            btnCancel = (ButtonPlus) inflaterView.findViewById(getIdBtnCancel());
            resetView();
            ButterKnife.bind(this, inflaterView);

        }
        return inflaterView;
    }

    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        initVariable();
        initView(view, savedInstanceState);
        initListener(view, savedInstanceState);
        onDismissDialog(view);
    }

    public FragmentComponent getFragmentComponent() {
        return fragmentComponent;
    }

    public void onDismissDialog(View v) {
        try {
            v.findViewById(getIdResContainView()).setOnTouchListener(new View.OnTouchListener() {
                @Override
                public boolean onTouch(View view, MotionEvent motionEvent) {
                    dismiss();
                    return false;
                }
            });
        } catch (Exception ex) {
            Log.e("Dialog", "IdContainView not exits");
        }
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
    }
}
