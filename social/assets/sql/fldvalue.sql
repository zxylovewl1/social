delete from fldvalue where tabname='entity';
insert into fldvalue(sys,tabname,colname,disporder,dbvalue,dispc,dispe) values('0',     'entity',         'domain',       1,            '1',            '教育',         'Edu');
insert into fldvalue(sys,tabname,colname,disporder,dbvalue,dispc,dispe) values('0',     'entity',         'domain',       2,            '99',           '配置',         'Config');
insert into fldvalue(sys,tabname,colname,disporder,dbvalue,dispc,dispe) values('0',     'entity',         'type',         1,            '1',            '表',           'Table');
insert into fldvalue(sys,tabname,colname,disporder,dbvalue,dispc,dispe) values('0',     'entity',         'type',         2,            '2',            '点',           'Point');
insert into fldvalue(sys,tabname,colname,disporder,dbvalue,dispc,dispe) values('0',     'entity',         'type',         3,            '3',            '线',           'Line');
insert into fldvalue(sys,tabname,colname,disporder,dbvalue,dispc,dispe) values('0',     'entity',         'type',         4,            '4',            '面',           'Polygon');
insert into fldvalue(sys,tabname,colname,disporder,dbvalue,dispc,dispe) values('0',     'entity',         'log',          1,            '0',            '否',           'False');
insert into fldvalue(sys,tabname,colname,disporder,dbvalue,dispc,dispe) values('0',     'entity',         'log',          2,            '1',            '是',           'True');


delete from fldvalue where tabname='fld';
insert into fldvalue(sys,tabname,colname,disporder,dbvalue,dispc,dispe) values('99',    'fld',            'isnum',        1,            '1',            '是',           'Yes');
insert into fldvalue(sys,tabname,colname,disporder,dbvalue,dispc,dispe) values('99',    'fld',            'isnum',        2,            '0',            '否',           'No');
insert into fldvalue(sys,tabname,colname,disporder,dbvalue,dispc,dispe) values('99',    'fld',            'disptype',     1,            '1',            '文本',         'Edit');
insert into fldvalue(sys,tabname,colname,disporder,dbvalue,dispc,dispe) values('99',    'fld',            'disptype',     2,            '2',            '下拉框',       'DropList');
insert into fldvalue(sys,tabname,colname,disporder,dbvalue,dispc,dispe) values('99',    'fld',            'disptype',     3,            '3',            '日期',         'Date');
insert into fldvalue(sys,tabname,colname,disporder,dbvalue,dispc,dispe) values('99',    'fld',            'disptype',     4,            '4',            '富文本',       'Rich Text');
insert into fldvalue(sys,tabname,colname,disporder,dbvalue,dispc,dispe) values('99',    'fld',            'disptype',     5,            '5',            '日期+时间',    'Date + Time');
insert into fldvalue(sys,tabname,colname,disporder,dbvalue,dispc,dispe) values('99',    'fld',            'disptype',     6,            '6',            '下拉(可改)',   'DropDown');
insert into fldvalue(sys,tabname,colname,disporder,dbvalue,dispc,dispe) values('99',    'fld',            'newedit',      1,            '1',            '是',           'Yes');
insert into fldvalue(sys,tabname,colname,disporder,dbvalue,dispc,dispe) values('99',    'fld',            'newedit',      2,            '0',            '否',           'No');
insert into fldvalue(sys,tabname,colname,disporder,dbvalue,dispc,dispe) values('99',    'fld',            'editable',     1,            '1',            '是',           'Yes');
insert into fldvalue(sys,tabname,colname,disporder,dbvalue,dispc,dispe) values('99',    'fld',            'editable',     2,            '0',            '否',           'No');
insert into fldvalue(sys,tabname,colname,disporder,dbvalue,dispc,dispe) values('99',    'fld',            'nullable',     1,            '1',            '是',           'Yes');
insert into fldvalue(sys,tabname,colname,disporder,dbvalue,dispc,dispe) values('99',    'fld',            'nullable',     2,            '0',            '否',           'No');
insert into fldvalue(sys,tabname,colname,disporder,dbvalue,dispc,dispe) values('99',    'fld',            'qrylevel',     1,            '1',            '第1级',        'Level 1');
insert into fldvalue(sys,tabname,colname,disporder,dbvalue,dispc,dispe) values('99',    'fld',            'qrylevel',     2,            '2',            '第2级',        'Level 2');
