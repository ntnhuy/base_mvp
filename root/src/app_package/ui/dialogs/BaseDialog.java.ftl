package ${packageName}.ui.dialogs;

import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.view.View;

import ${packageName}.R;
import ${packageName}.app.bases.BaseDialogFragment;
import ${packageName}.widgets.TextViewPlus;

import javax.inject.Inject;

import butterknife.BindView;

/**
 * Created by tohuy on 9/20/2017.
 */

public class BaseDialog extends BaseDialogFragment implements BaseDialogMvp {

    @BindView(R.id.tv_content)
    TextViewPlus tvContent;

    @Inject
    BaseDialogPresenter mPresenter;

    public static BaseDialog newInstance() {

        Bundle args = new Bundle();

        BaseDialog fragment = new BaseDialog();
        fragment.setStyle(DialogFragment.STYLE_NO_TITLE, R.style.dialog);
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    protected int getLayoutRes() {
        return R.layout.dialog_frag_test_base;
    }

    @Override
    protected int getIdResContainView() {
        return R.id.container;
    }

    @Override
    protected int getIdBtnCancel() {
        return R.id.btn_cancel;
    }

    @Override
    protected int getIdBtnOK() {
        return  R.id.btn_ok;
    }

    @Override
    protected int getIdIvLeft() {
        return R.id.iv_left;
    }

    @Override
    protected int getIdIvRight() {
        return R.id.iv_right;
    }

    @Override
    protected int getIdTvTitle() {
        return R.id.tv_title;
    }

    @Override
    protected void initVariable() {
        getFragmentComponent().inject(this);
        mPresenter.attachView(this);
    }

    @Override
    protected void initView(View view, Bundle saveInstanceBundle) {
        tvTitle.setText("BaseMvp");
        tvContent.setText("Do you send any thing?");
    }

    @Override
    protected void initListener(View view, Bundle savedInstanceState) {
        btnOk.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                mPresenter.clickBtnOk();
            }
        });
        ivRight.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                mPresenter.clickIvRight();
            }
        });
    }

    @Override
    public void resetView() {
        ivLeft.setVisibility(View.GONE);
        tvTitle.setVisibility(View.VISIBLE);
        ivRight.setVisibility(View.VISIBLE);
        btnOk.setVisibility(View.VISIBLE);
        btnCancel.setVisibility(View.GONE);
    }

    @Override
    public void onDismissDialog() {
        dismiss();
    }
}
