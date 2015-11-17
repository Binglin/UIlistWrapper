Pod::Spec.new do |s|
    s.name         = 'UIlistWrapper'
    s.version      = '1.0.0'
    s.summary      = 'An UITableView or UICollectionView data manager'
    s.homepage     = 'https://github.com/Binglin/UIlistWrapper.git'
#    s.license      = 'MIT'
    s.authors      = {'Binglin' => '269042025@qq.com'}
    s.platform     = :ios, '6.0'
    s.source       = {:git => 'https://github.com/CoderMJLee/MJRefresh.git', :tag => s.version}
    s.source_files = 'UIlistWrapper/UIlistWrapper/**/'
    s.requires_arc = true
end