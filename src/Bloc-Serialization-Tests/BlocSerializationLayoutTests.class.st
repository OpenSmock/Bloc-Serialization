Class {
	#name : #BlocSerializationLayoutTests,
	#superclass : #BlocSerializationTests,
	#category : #'Bloc-Serialization-Tests'
}

{ #category : #asserting }
BlocSerializationLayoutTests >> assertExactConstraint: aPoint forElement: anElement [

	self
		assert: anElement constraints horizontal resizer size
		equals: aPoint x.
	self
		assert: anElement constraints vertical resizer size
		equals: aPoint y
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlFrameLayoutChildrenTest1 [

	| origin |
	origin := BlFrameLayoutChildrenTest new
		          testChildElementWithExactSize100per50.
	self
		test: origin
		on: [ :element | 
		self assert: element position equals: 0 @ 0.
	self assert: element extent equals: 0 @ 0.
	self assertExactConstraint: 100 @ 50 forElement: element. ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlFrameLayoutChildrenTest2 [

	| origin |
	origin := BlFrameLayoutChildrenTest new
		          testParentWithFrameLayoutAndFixedSize.
	self
		test: origin
		on: [ :element | 
		self assert: element layout class equals: BlFrameLayout ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlFrameLayoutChildrenTest3 [

	| origin |
	origin := BlFrameLayoutChildrenTest new
		          testParentWithFrameLayoutAndFixedSize300per250.
	self
		test: origin
		on: [ :element | 
			self assert: element position equals: 0 @ 0.
	self assert: element extent equals: 0 @ 0.
	self assert: element constraints horizontal resizer size equals: 300.
	self assert: element constraints vertical resizer size equals: 250.
	self assert: element layout class equals: BlFrameLayout.
	self assert: element border width equals: 3.
	self assert: element border paint equals: Color red asBlPaint. ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlFrameLayoutMultipleChildrenTestTest1 [

	| origin |
	origin := BlFrameLayoutMultipleChildrenTest new
		          testChildElementWithExactSize140per140.
	self test: origin on: [ :element | 
		self assert: element position equals: 0 @ 0.
		self assert: element extent equals: 0 @ 0.
		self assertExactConstraint: 140 @ 140 forElement: element ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlFrameLayoutMultipleChildrenTestTest2 [

	| origin childOne childTwo |
	origin := BlFrameLayoutMultipleChildrenTest new
		          testElementWithExactChildAlignLeftCenterAndExactChildCenter.
	self test: origin on: [ :parent | 
		childOne := parent childAt: 1.
		childTwo := parent childAt: 2.
		parent forceLayout.
		self assert: childOne position equals: 0 @ 55.
		self assert: childOne extent equals: 140 @ 140.
		self assert: childTwo position equals: 100 @ 100.
		self assert: childTwo extent equals: 100 @ 50.
		self assert: parent position equals: 0 @ 0.
		self assert: parent extent equals: 300 @ 250 ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlFrameLayoutMultipleChildrenTestTest3 [

	| origin childOne childTwo |
	origin := BlFrameLayoutMultipleChildrenTest new
		          testElementWithExactChildAlignTopLeftAndExactChildRightCenter.
	self test: origin on: [ :parent | 
		childOne := parent childAt: 1.
		childTwo := parent childAt: 2.
		parent forceLayout.
		self assert: childOne position equals: 0 @ 0.
	self assert: childOne extent equals: 140 @ 140.
	self assert: childTwo position equals: 200 @ 100.
	self assert: childTwo extent equals: 100 @ 50.
	self assert: parent position equals: 0 @ 0.
	self assert: parent extent equals: 300 @ 250. ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlFrameLayoutMultipleChildrenTestTest4 [

	| origin childTopLeft childTopCenter childTopRight childCenterLeft childCenterCenter childCenterRight childBottomLeft childBottomCenter childBottomRight |
	origin := BlFrameLayoutMultipleChildrenTest new
		          testElementWithNineExactChildrenWithAllAlignments.
	self test: origin on: [ :parent | 
		childTopLeft := parent childAt: 1.
		childTopCenter := parent childAt: 2.
		childTopRight := parent childAt: 3.
		childCenterLeft := parent childAt: 4.
		childCenterCenter := parent childAt: 5.
		childCenterRight := parent childAt: 6.
		childBottomLeft := parent childAt: 7.
		childBottomCenter := parent childAt: 8.
		childBottomRight := parent childAt: 9.
		parent forceLayout.self assert: parent position equals: 0 @ 0.
	self assert: parent extent equals: 300 @ 250. ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlFrameLayoutMultipleChildrenTestTest5 [

	| origin childOne childTwo |
	origin := BlFrameLayoutMultipleChildrenTest new
		          testElementWithTwoChildrenMatchingParentWithWeight.
	self test: origin on: [ :parent | 
		childOne := parent childAt: 1.
		childTwo := parent childAt: 2.
		parent forceLayout.
		self assert: childOne position equals: 0 @ 0.
	self assert: childOne extent equals: 270 @ 125.
	self assert: childTwo position equals: 0 @ 0.
	self assert: childTwo extent equals: 150 @ 225.
	self assert: parent position equals: 0 @ 0.
	self assert: parent extent equals: 300 @ 250. ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlFrameLayoutMultipleChildrenTestTest6 [

	| origin childOne childTwo |
	origin := BlFrameLayoutMultipleChildrenTest new
		          testElementWithTwoExactChildrenAndFitContentParent.
	self test: origin on: [ :parent | 
		childOne := parent childAt: 1.
		childTwo := parent childAt: 2.
		parent forceLayout.
		self assert: childOne position equals: 0 @ 0.
	self assert: childOne extent equals: 250 @ 100.
	self assert: childTwo position equals: 0 @ 0.
	self assert: childTwo extent equals: 100 @ 250.
	self assert: parent position equals: 0 @ 0.
	self assert: parent extent equals: 250 @ 250. ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlFrameLayoutMultipleChildrenTestTest7 [

	| origin childOne childTwo |
	origin := BlFrameLayoutMultipleChildrenTest new
		          testElementWithTwoExactChildrenAndNoAlignment.
	self test: origin on: [ :parent | 
		childOne := parent childAt: 1.
		childTwo := parent childAt: 2.
		parent forceLayout.
		self assert: childOne position equals: 0 @ 0.
	self assert: childOne extent equals: 140 @ 140.
	self assert: childTwo position equals: 0 @ 0.
	self assert: childTwo extent equals: 100 @ 50.
	self assert: parent position equals: 0 @ 0.
	self assert: parent extent equals: 300 @ 250. ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlLinearLayoutHorizontalTest1 [

	| origin childA |
	origin := BlLinearLayoutHorizontalTest new
		          testElementWithOneChildMatchInExactParentPadding.
	self test: origin on: [ :parent | 
		childA := parent childAt: 1.
		parent forceLayout.
		self assert: childA extent equals: 360 @ 560.
		self assert: childA position equals: 20 @ 20.
		self assert: parent extent equals: 400 @ 600.
		self assert: parent position equals: 0 @ 0 ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlLinearLayoutHorizontalTest10 [

	| origin   |
	origin := BlLinearLayoutHorizontalTest new
		          testParentWithLinearHorizontalLayout.
	self test: origin on: [ :element | 
	self assert: element layout class equals: BlLinearLayout.
	self assert: element layout isHorizontal. ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlLinearLayoutHorizontalTest2 [

	| origin childA childB |
	origin := BlLinearLayoutHorizontalTest new
		          testElementWithOneChildMatchOneExactInFitParent.
	self test: origin on: [ :parent | 
		childA := parent childAt: 1.
		childB := parent childAt: 2.
		parent forceLayout.
		self assert: childA extent equals: 300 @ 200.
	self assert: childA position equals: 0 @ 0.
	self assert: childB extent equals: 200 @ 200.
	self assert: childB position equals: 300 @ 0.
	self assert: parent extent equals: 500 @ 200.
	self assert: parent position equals: 0 @ 0. ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlLinearLayoutHorizontalTest3 [

	| origin childA |
	origin := BlLinearLayoutHorizontalTest new
		          testElementWithOneExactChildInExactParentMargin.
	self test: origin on: [ :parent | 
		childA := parent childAt: 1.
		parent forceLayout.
		self assert: childA extent equals: 20 @ 20.
	self assert: childA position equals: 10 @ 15.
	self assert: parent extent equals: 50 @ 50.
	self assert: parent position equals: 0 @ 0. ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlLinearLayoutHorizontalTest4 [

	| origin childA childB childC |
	origin := BlLinearLayoutHorizontalTest new
		          testElementWithThreeMatchChildrenInExactParent.
	self test: origin on: [ :parent | 
		childA := parent childAt: 1.
		childB := parent childAt: 2.
		childC := parent childAt: 3.
		parent forceLayout.
		self assert: childA extent equals: 200 @ 200.
	self assert: childA position equals: 0 @ 0.
	self assert: childB extent equals: 200 @ 200.
	self assert: childB position equals: 200 @ 0.
	self assert: childC extent equals: 200 @ 200.
	self assert: childC position equals: 400 @ 0.
	self assert: parent extent equals: 600 @ 200.
	self assert: parent position equals: 0 @ 0 ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlLinearLayoutHorizontalTest5 [

	| origin childA childB childC |
	origin := BlLinearLayoutHorizontalTest new
		          testElementWithThreeMatchChildrenInExactParentRTL.
	self test: origin on: [ :parent | 
		childA := parent childAt: 1.
		childB := parent childAt: 2.
		childC := parent childAt: 3.
		parent forceLayout.
		self assert: childC extent equals: 200 @ 200.
	self assert: childC position equals: 0 @ 0.
	self assert: childB extent equals: 200 @ 200.
	self assert: childB position equals: 200 @ 0.
	self assert: childA extent equals: 200 @ 200.
	self assert: childA position equals: 400 @ 0.
	self assert: parent extent equals: 600 @ 200.
	self assert: parent position equals: 0 @ 0]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlLinearLayoutHorizontalTest6 [

	| origin childA childB |
	origin := BlLinearLayoutHorizontalTest new
		          testElementWithTwoChildrenMatchInExactParentPadding.
	self test: origin on: [ :parent | 
		childA := parent childAt: 1.
		childB := parent childAt: 2.
		parent forceLayout.
		self assert: childA extent equals: 180 @ 560.
	self assert: childA position equals: 20 @ 20.
	self assert: childB extent equals: 180 @ 560.
	self assert: childB position equals: 200 @ 20.
	self assert: parent extent equals: 400 @ 600.
	self assert: parent position equals: 0 @ 0. ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlLinearLayoutHorizontalTest7 [

	| origin childA childB |
	origin := BlLinearLayoutHorizontalTest new
		          testElementWithTwoExactChildrenInFitContent.
	self test: origin on: [ :parent | 
		childA := parent childAt: 1.
		childB := parent childAt: 2.
		parent forceLayout.
		self assert: childA extent equals: 200 @ 100.
	self assert: childA position equals: 0 @ 0.
	self assert: childB extent equals: 100 @ 200.
	self assert: childB position equals: 200 @ 0.
	self assert: parent extent equals: 300 @ 200.
	self assert: parent position equals: 0 @ 0. ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlLinearLayoutHorizontalTest8 [

	| origin childA childB |
	origin := BlLinearLayoutHorizontalTest new
		          testElementWithTwoMatchChildrenInExactParent.
	self test: origin on: [ :parent | 
		childA := parent childAt: 1.
		childB := parent childAt: 2.
		parent forceLayout.
		self assert: childA extent equals: 250 @ 200.
	self assert: childA position equals: 0 @ 0.
	self assert: childB extent equals: 250 @ 200.
	self assert: childB position equals: 250 @ 0.
	self assert: parent extent equals: 500 @ 200.
	self assert: parent position equals: 0 @ 0. ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlLinearLayoutHorizontalTest9 [

	| origin aRed aBlue |
	origin := BlLinearLayoutHorizontalTest new
		          testOneChildSetVisibilityGone.
	self test: origin on: [ :aContainer | 
		aRed := aContainer childAt: 1.
		aBlue := aContainer childAt: 2.
		aRed visibility: BlVisibility visible.
		aContainer forceLayout.
		self assert: aContainer extent equals: 500 @ 400.
	self assert: aRed position equals: 20 @ 10.
	self assert: aRed extent equals: 220 @ 380.
	self assert: aBlue position equals: 260 @ 10.
	self assert: aBlue extent equals: 220 @ 380.
	aRed visibility: BlVisibility gone.
	aContainer forceLayout.
	self assert: aContainer extent equals: 500 @ 400.
	"red keeps its position and extent from the previous pass"
	self assert: aRed position equals: 20 @ 10.
	self assert: aRed extent equals: 220 @ 380.
	self assert: aBlue position equals: 20 @ 10.
	self assert: aBlue extent equals: 460 @ 380. ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlLinearLayoutUsageTest1 [

	| origin child |
	origin := BlLinearLayoutUsageTest new
		          testMatchParentInFitContent.
	self test: origin on: [ :parent | 
		child := parent childAt: 1.
		parent forceLayout.
		self assert: parent extent equals: 300 @ 50.
		self assert: child extent equals: 100 @ 0 ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlLinearLayoutUsageTest10 [

	| origin childA childB childC |
	origin := BlLinearLayoutUsageTest new
		          testOneChildWithFitContentLimitedExceedsNotAndTwoChildlren.
	self test: origin on: [ :parent | 
		childA := parent childAt: 2.
		childB := parent childAt: 3.
		childC := parent childAt: 1.
		parent forceLayout.
		self assert: parent extent equals: 300 @ 400.
	self assert: childA extent equals: 260 @ 140.
	self assert: childB extent equals: 100 @ 75.
	self assert: childC extent equals: 75 @ 50. ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlLinearLayoutUsageTest2 [

	| origin child |
	origin := BlLinearLayoutUsageTest new
		          testMatchParentInFitContentChangeBackToMatchParent.
	self test: origin on: [ :parent | 
		child := parent childAt: 1.
		parent forceLayout.
		self assert: parent extent equals: 300 @ 50.
		self assert: child extent equals: 100 @ 0 ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlLinearLayoutUsageTest3 [

	| origin child |
	origin := BlLinearLayoutUsageTest new
		          testMatchParentInFitContentChangeToExact.
	self test: origin on: [ :parent | 
		child := parent childAt: 1.
		parent forceLayout.
		self assert: parent extent equals: 300 @ 250.
		self assert: child extent equals: 100 @ 200 ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlLinearLayoutUsageTest4 [

	| origin child subChildren |
	origin := BlLinearLayoutUsageTest new
		          testOneChildWithFitContentLimited.
	self test: origin on: [ :parent | 
		child := parent childAt: 1.
		subChildren := child childAt: 1.
		parent forceLayout.
		self assert: parent extent equals: 300 @ 400.
	self assert: child extent equals: 300 @ 400. ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlLinearLayoutUsageTest5 [

	| origin childA childB subChildren |
	origin := BlLinearLayoutUsageTest new
		          testOneChildWithFitContentLimitedAndAnotherChild.
	self test: origin on: [ :parent | 
		childA := parent childAt: 1.
		childB := parent childAt: 2.
		subChildren := childA childAt: 1.
		parent forceLayout.
		self assert: parent extent equals: 300 @ 400.
	self assert: childA extent equals: 300 @ 325.
	self assert: childB extent equals: 100 @ 75. ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlLinearLayoutUsageTest6 [

	| origin childA childB subChildA subChildB |
	origin := BlLinearLayoutUsageTest new
		          testOneChildWithFitContentLimitedAndAnotherChildFitContent.
	self test: origin on: [ :parent | 
		childA := parent childAt: 1.
		childB := parent childAt: 2.
		subChildA := childA childAt: 1.
		subChildB := childB childAt: 1.
		parent forceLayout.
		self assert: parent extent equals: 300 @ 400.
		self assert: childA extent equals: 300 @ 325.
		self assert: childB extent equals: 300 @ 75.
		self assert: subChildB extent equals: 100 @ 75 ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlLinearLayoutUsageTest7 [

	| origin childA childB childC childD |
	origin := BlLinearLayoutUsageTest new
		          testOneChildWithFitContentLimitedExceedsAndThreeChildlren.
	self test: origin on: [ :parent | 
		childA := parent childAt: 2.
		childB := parent childAt: 3.
		childC := parent childAt: 1.
		childD := parent childAt: 4.
		parent forceLayout.
		self assert: parent extent equals: 300 @ 400.
	self assert: childA extent equals: 260 @ 175.
	self assert: childB extent equals: 100 @ 75.
	self assert: childC extent equals: 75 @ 50.
	self assert: childD extent equals: 260 @ 0. ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlLinearLayoutUsageTest8 [

	| origin childA childB childC |
	origin := BlLinearLayoutUsageTest new
		          testOneChildWithFitContentLimitedExceedsAndTwoChildlren.
	self test: origin on: [ :parent | 
		childA := parent childAt: 2.
		childB := parent childAt: 3.
		childC := parent childAt: 1.
		parent forceLayout.
		self assert: parent extent equals: 300 @ 400.
		self assert: childA extent equals: 260 @ 195.
		self assert: childB extent equals: 100 @ 75.
		self assert: childC extent equals: 75 @ 50 ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlLinearLayoutUsageTest9 [

	| origin childA childB childC childD |
	origin := BlLinearLayoutUsageTest new
		          testOneChildWithFitContentLimitedExceedsNotAndThreeChildlren.
	self test: origin on: [ :parent | 
		childA := parent childAt: 2.
		childB := parent childAt: 3.
		childC := parent childAt: 1.
		childD := parent childAt: 4.
		parent forceLayout.
		self assert: parent extent equals: 300 @ 400.
	self assert: childA extent equals: 260 @ 140.
	self assert: childB extent equals: 100 @ 75.
	self assert: childC extent equals: 75 @ 50.
	self assert: childD extent equals: 260 @ 35. ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlLinearLayoutVerticalTest1 [

	| origin childA |
	origin := BlLinearLayoutVerticalTest new
		          testElementWithChildMatchInExactParentPadding.
	self test: origin on: [ :parent | 
		childA := parent childAt: 1.
		parent forceLayout.
		self assert: childA extent equals: 360 @ 560.
		self assert: childA position equals: 20 @ 20.
		self assert: parent extent equals: 400 @ 600.
		self assert: parent position equals: 0 @ 0 ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlLinearLayoutVerticalTest10 [

	| origin |
	origin := BlLinearLayoutVerticalTest new
		          testParentWithLinearHorizontalLayout.
	self test: origin on: [ :element | 
		element forceLayout.
		self assert: element layout class equals: BlLinearLayout.
	self assert: element layout isVertical. ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlLinearLayoutVerticalTest2 [

	| origin childA childB |
	origin := BlLinearLayoutVerticalTest new
		          testElementWithChildrenMatchInExactParentPadding.
	self test: origin on: [ :parent | 
		childA := parent childAt: 1.
		childB := parent childAt: 2.
		parent forceLayout.self assert: childA extent equals: 560 @ 180.
	self assert: childA position equals: 20 @ 20.
	self assert: childB extent equals: 560 @ 180.
	self assert: childB position equals: 20 @ 200.
	self assert: parent extent equals: 600 @ 400.
	self assert: parent position equals: 0 @ 0. ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlLinearLayoutVerticalTest3 [

	| origin childA childB childC |
	origin := BlLinearLayoutVerticalTest new
		          testElementWithMatchChildrenInExactParent.
	self test: origin on: [ :parent | 
		childA := parent childAt: 1.
		childB := parent childAt: 2.
		childC := parent childAt: 3.
		parent forceLayout.
		self assert: childA extent equals: 200 @ 200.
		self assert: childA position equals: 0 @ 0.
		self assert: childB extent equals: 200 @ 200.
		self assert: childB position equals: 0 @ 200.
		self assert: childC extent equals: 200 @ 200.
		self assert: childC position equals: 0 @ 400.
		self assert: parent extent equals: 200 @ 600.
		self assert: parent position equals: 0 @ 0 ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlLinearLayoutVerticalTest4 [

	| origin childA childB |
	origin := BlLinearLayoutVerticalTest new
		          testElementWithOneChildMatchOneExactInFitParent.
	self test: origin on: [ :parent | 
		childA := parent childAt: 1.
		childB := parent childAt: 2.
		parent forceLayout.
		self assert: childA extent equals: 200 @ 300.
	self assert: childA position equals: 0 @ 0.
	self assert: childB extent equals: 200 @ 200.
	self assert: childB position equals: 0 @ 300.
	self assert: parent extent equals: 200 @ 500.
	self assert: parent position equals: 0 @ 0. ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlLinearLayoutVerticalTest5 [

	| origin childA |
	origin := BlLinearLayoutVerticalTest new
		          testElementWithOneExactChildInExactParentMargin.
	self test: origin on: [ :parent | 
		childA := parent childAt: 1.
		parent forceLayout.
		self assert: childA extent equals: 20 @ 20.
	self assert: childA position equals: 10 @ 15.
	self assert: parent extent equals: 50 @ 50.
	self assert: parent position equals: 0 @ 0]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlLinearLayoutVerticalTest6 [

	| origin childA childB childC |
	origin := BlLinearLayoutVerticalTest new
		          testElementWithThreeExactChildrenAlignInExactParentLTR.
	self test: origin on: [ :parent | 
		childA := parent childAt: 1.
		childB := parent childAt: 2.
		childC := parent childAt: 3.
		parent forceLayout.
		self assert: childA extent equals: 100 @ 100.
	self assert: childA position equals: 0 @ 0.
	self assert: childB extent equals: 200 @ 100.
	self assert: childB position equals: 150 @ 100.
	self assert: childC extent equals: 50 @ 100.
	self assert: childC position equals: 450 @ 200.
	self assert: parent extent equals: 500 @ 600.
	self assert: parent position equals: 0 @ 0. ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlLinearLayoutVerticalTest7 [

	| origin childA |
	origin := BlLinearLayoutVerticalTest new
		          testElementWithOneExactChildInExactParentMargin.
	self test: origin on: [ :parent | 
		childA := parent childAt: 1.
		parent forceLayout.
		self assert: childA extent equals: 20 @ 20.
	self assert: childA position equals: 10 @ 15.
	self assert: parent extent equals: 50 @ 50.
	self assert: parent position equals: 0 @ 0. ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlLinearLayoutVerticalTest8 [

	| origin childA childB childC |
	origin := BlLinearLayoutVerticalTest new
		          testElementWithThreeExactChildrenAlignInExactParentRTL.
	self test: origin on: [ :parent | 
		childA := parent childAt: 1.
		childB := parent childAt: 2.
		childC := parent childAt: 3.
		parent forceLayout.
		self assert: childA extent equals: 100 @ 100.
	self assert: childA position equals: 400 @ 0.
	self assert: childB extent equals: 200 @ 100.
	self assert: childB position equals: 150 @ 100.
	self assert: childC extent equals: 50 @ 100.
	self assert: childC position equals: 0 @ 200.
	self assert: parent extent equals: 500 @ 600.
	self assert: parent position equals: 0 @ 0. ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlLinearLayoutVerticalTest9 [

	| origin aRed aBlue |
	origin := BlLinearLayoutVerticalTest new
		          testOneChildSetVisibilityGone.
	self test: origin on: [ :aContainer | 
		aRed := aContainer childAt: 1.
		aBlue := aContainer childAt: 2.
		aRed visibility: BlVisibility visible.
		aContainer forceLayout.
		self assert: aContainer extent equals: 400 @ 500.
		self assert: aRed position equals: 10 @ 20.
		self assert: aRed extent equals: 380 @ 220.
		self assert: aBlue position equals: 10 @ 260.
		self assert: aBlue extent equals: 380 @ 220.
		aRed visibility: BlVisibility gone.
		aContainer forceLayout.
		self assert: aContainer extent equals: 400 @ 500.
		"red keeps its position and extent from the previous pass"
		self assert: aRed position equals: 10 @ 20.
		self assert: aRed extent equals: 380 @ 220.
		self assert: aBlue position equals: 10 @ 20.
		self assert: aBlue extent equals: 380 @ 460 ]
]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlOnceLayoutTest1 [

	| origin aChildA aChildB aChildC |
	origin := BlOnceLayoutTest new testOnceLinearLayoutExact.
	self test: origin on: [ :aContainer | 
		aChildA := aContainer childAt: 1.
		aChildB := aContainer childAt: 2.
		aChildC := aContainer childAt: 3.
		aContainer forceLayout.
		self assert: aContainer layout isStopped.
		self
			assert: aContainer bounds asRectangle
			equals: (0 @ 0 extent: 400 @ 300).
		self
			assert: aChildA bounds asRectangle
			equals: (0 @ 10 extent: 150 @ 80).
		self
			assert: aChildB bounds asRectangle
			equals: (0 @ 100 extent: 250 @ 80).
		self
			assert: aChildC bounds asRectangle
			equals: (0 @ 190 extent: 200 @ 80).
		self assert: aChildA constraints position equals: 0 @ 10.
		self assert: aChildB constraints position equals: 0 @ 100.
		self assert: aChildC constraints position equals: 0 @ 190.
		self
			assert: aChildA constraints horizontal resizer
			equals: (BlLayoutResizer exact: 150).
		self
			assert: aChildA constraints vertical resizer
			equals: (BlLayoutResizer exact: 80).
		self
			assert: aChildB constraints horizontal resizer
			equals: (BlLayoutResizer exact: 250).
		self
			assert: aChildB constraints vertical resizer
			equals: (BlLayoutResizer exact: 80).
		self
			assert: aChildC constraints horizontal resizer
			equals: (BlLayoutResizer exact: 200).
		self
			assert: aChildC constraints vertical resizer
			equals: (BlLayoutResizer exact: 80) ].

]

{ #category : #tests }
BlocSerializationLayoutTests >> testBlOnceLayoutTest2 [

	| origin aChildA aChildB aChildC |
	origin := BlOnceLayoutTest new testOnceLinearLayoutMatchParent.
	self test: origin on: [ :aContainer | 
		aChildA := aContainer childAt: 1.
		aChildB := aContainer childAt: 2.
		aChildC := aContainer childAt: 3.
		aContainer forceLayout.
		self assert: aContainer layout isStopped.
		self
			assert: aContainer bounds asRectangle
			equals: (0 @ 0 extent: 400 @ 300).
		self
			assert: aChildA bounds asRectangle
			equals: (0 @ 15 extent: 400 @ 80).
		self
			assert: aChildB bounds asRectangle
			equals: (0 @ 110 extent: 400 @ 80).
		self
			assert: aChildC bounds asRectangle
			equals: (0 @ 205 extent: 400 @ 80).
		self assert: aChildA constraints position equals: 0 @ 15.
		self assert: aChildB constraints position equals: 0 @ 110.
		self assert: aChildC constraints position equals: 0 @ 205.
		self
			assert: aChildA constraints horizontal resizer
			equals: (BlLayoutResizer exact: 400).
		self
			assert: aChildA constraints vertical resizer
			equals: (BlLayoutResizer exact: 80).
		self
			assert: aChildB constraints horizontal resizer
			equals: (BlLayoutResizer exact: 400).
		self
			assert: aChildB constraints vertical resizer
			equals: (BlLayoutResizer exact: 80).
		self
			assert: aChildC constraints horizontal resizer
			equals: (BlLayoutResizer exact: 400).
		self
			assert: aChildC constraints vertical resizer
			equals: (BlLayoutResizer exact: 80) ]
]
