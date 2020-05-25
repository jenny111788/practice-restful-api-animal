<?php

namespace App\Http\Controllers;

use App\Animal;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Http\Resources\AnimalResource;

class AnimalController extends Controller
{
    //設定操作資源需驗證的方法
    public function __construct()
    {
        //除了 index (查詢清單) 、 show (查詢單一資源) 不需要驗證其他必需認證才可以操作
        $this->middleware('auth:api', ['expect' => ['index', 'show']]);
    }
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //查詢系統目前的動物列表
        // $animals = Animal::get();

        //設定預設值 marker:指定從哪個ID開始 limit:返回多少項目
        $marker = $request->marker == null ? 1 : $request->marker ;
        $limit = $request->limit == null ? 10 : $request->limit ;

        //分頁查詢
        // $animals = Animal::orderBy('id', 'asc')
        //     ->where('id', '>=', $marker)
        //     ->limit($limit)
        //     ->get();

        // //Laravel內建分頁查詢
        // $animals = Animal::orderBy('id', 'asc')
        //     ->where('id', '>=', $marker)
        //     ->paginate($limit);

        $query = Animal::query();

        //篩選欄位條件
        if (isset($request->filters)) {
            $filters = explode(',', $request->filters);
            foreach ($filters as $key => $filter) {
                list($criteria, $value) = explode(':', $filter);
                $query->where($criteria, 'like', "%$value%");
            }
        }

        //排列順序
        if (isset($request->sorts)) {
            $sorts = explode(',', $request->sorts);
            foreach ($sorts as $key => $sort) {
                list($criteria, $value) = explode(':', $sort);
                if ($value == 'asc' || $value == 'desc') {
                    $query->orderBy($criteria, $value);
                }
            }
        } else {
            $query->orderBy('id', 'asc');
        }

        $animals = $query->where('id', '>=', $marker)
            ->paginate($limit);

        return response(['animals' => $animals], Response::HTTP_OK);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //驗證資料格式
        $this->validate($request, [
            'type_id' => 'required',
            'name' => 'required|max:255',
            'birthday' => 'required|date',
            'area' => 'required|max:255',
            'fix' => 'required|boolean',
            'description' => 'nullable',
            'personality' => 'nullable',
        ]);
        
        //Animal Model 有 create 寫好的方法，把請求的內容，用all方法轉為陣列，傳入 create 方法中。
        $animal = Animal::create($request->all());

        // 回傳 animal 產生出來的實體物件資料，第二個參數設定狀態碼，可以直接寫 201 表示創建成功的狀態螞或用下面 Response 功能 
        return response($animal, Response::HTTP_CREATED);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Animal  $animal
     * @return \Illuminate\Http\Response
     */
    public function show(Animal $animal)
    {
        //查詢動物 單一 ID 的資料
        // return response($animal, Response::HTTP_OK);

        //回傳 Resource資料
        return response(new AnimalResource($animal), Response::HTTP_OK);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Animal  $animal
     * @return \Illuminate\Http\Response
     */
    public function edit(Animal $animal)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Animal  $animal
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Animal $animal)
    {
        //驗證資料格式
        $this->validate($request, [
            'type_id' => 'required',
            'name' => 'required|max:255',
            'birthday' => 'required|date',
            'area' => 'required|max:255',
            'fix' => 'required|boolean',
            'description' => 'nullable',
            'personality' => 'nullable',
        ]);
    
        //Animal Model 有 update 寫好的方法，把請求的內容，用all方法轉為陣列，傳入 update 方法中
        $animal->update($request->all());

        // 回傳 animal 產生出來的實體物件資料，第二個參數設定狀態碼，可以直接寫 200 表示更新成功的狀態螞或用下面 Response 功能
        return response($animal, Response::HTTP_OK);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Animal  $animal
     * @return \Illuminate\Http\Response
     */
    public function destroy(Animal $animal)
    {
        // 把這個實體物件刪除
        $animal->delete();

        // 回傳 null 並且給予 204 狀態碼
        return response(null, Response::HTTP_NO_CONTENT);
    }
}
