import React from "react";
import Pic from "../../../assets/why-us-section.png";
import { MdOutlineCleaningServices } from "react-icons/md";
import { TbDeviceMobileMessage } from "react-icons/tb";
import { MdOutlineHandshake } from "react-icons/md";

const WhyUsSection = () => {
  return (
    <div className="container my-24 px-6 mx-auto">
      <section className="mb-32 text-gray-800">
        <div className="block rounded-lg shadow-lg bg-white">
          <div className="grid grid-cols-2">
            <div className="hidden lg:flex grow-0 shrink-0 basis-auto lg:w-6/12 xl:w-10/12">
              <img
                src={Pic}
                alt="House Cleaning"
                className="w-full rounded-t-lg lg:rounded-tl-none lg:rounded-br-lg"
              />
            </div>
            <div className="grow-0 shrink-0 basis-auto w-full lg:w-6/12 xl:w-11/12">
              <div className="px-6 py-12 md:px-12">
                <h2 className="text-2xl font-bold mb-4 italic">why us</h2>
                <p className="uppercase text-secondary text-3xl font-bold mb-16 flex items-center">
                  What sets us apart
                </p>
                <div className="flex flex-wrap mb-12 md:mb-0">
                  <div className="grow-0 shrink-0 basis-auto w-2/12">
                    <MdOutlineCleaningServices className="text-secondary h-14 w-14" />
                  </div>

                  <div className="grow-0 shrink-0 basis-auto w-10/12 pl-4 md:pl-6">
                    <p className="mb-3">
                      <span className="font-semibold">
                        Thanks to professional-grade equipment, customized
                        solutions
                      </span>{" "}
                      <span>
                        and a team that takes a lot of pride in a job well done,
                        we’re able to produce results that impress.
                      </span>
                    </p>
                  </div>
                </div>

                <div className="flex flex-wrap mt-10 mb-12 md:mb-0">
                  <div className="grow-0 shrink-0 basis-auto w-2/12">
                    <TbDeviceMobileMessage className="text-secondary h-14 w-14" />
                  </div>

                  <div className="grow-0 shrink-0 basis-auto w-10/12 pl-4 md:pl-6">
                    <p className="mb-3">
                      <span className="font-semibold">
                        You’ll always be in-the-loop,
                      </span>
                      <span>
                        from on-the-way notifications to a final walk-through to
                        ensure satisfaction.
                      </span>
                    </p>
                  </div>
                </div>

                <div className="flex flex-wrap mt-10">
                  <div className="grow-0 shrink-0 basis-auto w-2/12">
                    <MdOutlineHandshake className="text-secondary h-14 w-14" />
                  </div>

                  <div className="grow-0 shrink-0 basis-auto w-10/12 pl-4 md:pl-6">
                    <p className="mb-3">
                      <span className="font-semibold">
                        Our local offices are backed by national resources,
                      </span>{" "}
                      <span>
                        including an innovation team solely dedicated to
                        improving our tools and systems.
                      </span>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
};

export default WhyUsSection;
