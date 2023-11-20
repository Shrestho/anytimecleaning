<?php
/*
 * File name: EstimateDataTable.php
 * Last modified: 2021.11.24 at 19:13:48
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2022
 */

namespace App\DataTables;

use App\Models\Estimate;
use Barryvdh\DomPDF\Facade as PDF;
use Yajra\DataTables\DataTableAbstract;
use Yajra\DataTables\EloquentDataTable;
use Yajra\DataTables\Html\Builder;
use Yajra\DataTables\Services\DataTable;

class EstimateDataTable extends DataTable
{
    /**
     * custom fields columns
     * @var array
     */
    public static $customFields = [];

    /**
     * Build DataTable class.
     *
     * @param mixed $query Results from query() method.
     * @return DataTableAbstract
     */
    public function dataTable($query)
    {
        $dataTable = new EloquentDataTable($query);
        $columns = array_column($this->getColumns(), 'data');
        $dataTable = $dataTable
            ->editColumn('email', function ($estimate) {
                return $estimate->email;
            })
            ->editColumn('subject', function ($estimate) {
                return $estimate->subject;
            })
            ->editColumn('phone_number', function ($estimate) {
                return $estimate->phone_number;
            })
            ->editColumn('message', function ($estimate) {
                return $estimate->message;
            })
            ->editColumn('service', function ($estimate) {
                return $estimate->service;
            })
            ->addColumn('action', 'estimates.datatables_actions')
            ->rawColumns(array_merge($columns, ['action']));

        return $dataTable;
    }

    /**
     * Get columns.
     *
     * @return array
     */
    protected function getColumns()
    {
        $columns = [
            [
                'data' => 'email',
                'title' => 'email',

            ],
            [
                'data' => 'subject',
                'title' => 'Subject',

            ],
            [
                'data' => 'phone_number',
                'title' => 'Phone number',

            ],
            [
                'data' => 'message',
                'title' => 'Message',
                'searchable' => false,
            ],
            [
                'data' => 'service',
                'title' => 'Service',
            ]
        ];
        return $columns;
    }

    /**
     * Get query source of dataTable.
     *
     * @param Entry $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(Estimate $model)
    {
        return $model->newQuery()->select('estimates.*');
    }

    /**
     * Optional method if you want to use html builder.
     *
     * @return Builder
     */
    public function html()
    {
        return $this->builder()
            ->columns($this->getColumns())
            ->minifiedAjax()
            ->addAction(['width' => '80px', 'printable' => false, 'responsivePriority' => '100'])
            ->parameters(array_merge(
                config('datatables-buttons.parameters'), [
                    'language' => json_decode(
                        file_get_contents(base_path('resources/lang/' . app()->getLocale() . '/datatable.json')
                        ), true),
                    'order' => [[0, 'asc']],
                ]
            ));
    }

    /**
     * Export PDF using DOMPDF
     * @return mixed
     */
    public function pdf()
    {
        $data = $this->getDataForPrint();
        $pdf = PDF::loadView($this->printPreview, compact('data'));
        return $pdf->download($this->filename() . '.pdf');
    }

    /**
     * Get filename for export.
     *
     * @return string
     */
    protected function filename()
    {
        return 'EstimateDataTable_' . time();
    }
}
