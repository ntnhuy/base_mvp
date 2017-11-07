package ${packageName}.ui.fragments.home;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import butterknife.ButterKnife;

import ${packageName}.R;
import ${packageName}.app.bases.BaseFragment;

import javax.inject.Inject;


public class HomeFragment extends BaseFragment implements HomeView {

    @Inject
    HomePresenter mPresenter;

    View view;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        if (view == null) {
            view = inflater.inflate(R.layout.fragment_home, container, false);
            ButterKnife.bind(this, view);
        }
        return view;
    }

    @Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
    }

    @Override
    public void onResume() {
        super.onResume();
        if (presenter != null) {
            presenter.onResume();
        }
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        presenter.onDestroy();
        presenter.detachView();
    }

    @Override
    public void setToolBar() {
        super.setToolBar();
    }

    @Override
    public void initVariable() {
        getFragmentComponent().inject(this);
        mPresenter.attachView(this);
    }

    @Override
    public void initView() {
        toolBar.setShowBack(true);
    }

    @Override
    public void initEvent() {
        
    }

    @Override
    public String getFragmentLabel() {
        return getString(R.string.fragment_home_label);
    }

    @Override
    public void refresh(boolean isRefreshData) {

    }

    @Override
    public void resetView() {

    }
}
